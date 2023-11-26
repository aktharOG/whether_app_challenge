import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:whether_app_challenge/model/forecast_model.dart';
import 'package:whether_app_challenge/model/weather_model_map.dart';
import 'package:whether_app_challenge/services/dio_services.dart';

class HomeProvider extends ChangeNotifier {
  Position? position;
  getCurrentLocation() async {
    position = await determinePosition();
    if (position != null) {
      print("location : ${position!.latitude} ${position!.longitude}");
      print(position!.speedAccuracy.toString());
      print(position!.altitude);
      await getWheatherUpdate();
      await getForecastUpdate();
    }
  }

  WeatherModelMap? weatherModelMap;
  bool isLoading = false;

  getWheatherUpdate() async {
    isLoading = true;
    notifyListeners();
    var data = {
      "locations": [
        {
          "q": "${position!.latitude},${position!.longitude}",
          "custom_id": "my-id-1"
        },
        // {"q": "India", "custom_id": "any-internal-id"},
        // {"q": "90201", "custom_id": "us-zipcode-id-765"}
      ]
    };
    print("data: $data");

    var d = jsonEncode(data);
    Response? response = await ApiService.apiMethodSetup(
        method: apiMethod.post,
        url: "http://api.weatherapi.com/v1/current.json",
        data: d,
        queryParameters: {
          "key": "ab38b93caee844598a095456232611",
          "q": "bulk"
        });

    if (response != null) {
      print(response.data.toString());
      var encode = jsonEncode(response.data["bulk"][0]);

      weatherModelMap = weatherModelMapFromJson(encode);
      if (weatherModelMap != null) {
        print(weatherModelMap!.query.location.name);
        isLoading = false;
        notifyListeners();
      }
    }
  }

  List<ForecastModel> forecastModel = [];
  getForecastUpdate() async {
    isLoading = true;
    notifyListeners();
    var data = {
      "locations": [
        {
          "q": "${position!.latitude},${position!.longitude}",
          "custom_id": "my-id-1"
        },
        // {"q": "India", "custom_id": "any-internal-id"},
        // {"q": "90201", "custom_id": "us-zipcode-id-765"}
      ]
    };
    print("dataForecadst: $data");

    var d = jsonEncode(data);
    Response? response = await ApiService.apiMethodSetup(
        method: apiMethod.post,
        url: "http://api.weatherapi.com/v1/forecast.json",
        data: d,
        queryParameters: {
          "key": "ab38b93caee844598a095456232611",
          "q": "bulk",
          "days": "4"
        });

    if (response != null) {
      print("forecast : ${response.data.toString()}");
      var encode = jsonEncode(
          response.data["bulk"][0]["query"]["forecast"]["forecastday"]);
      print(response.data["bulk"][0]["query"]["forecast"]["forecastday"]);

      forecastModel = forecastModelFromJson(encode);

      print("forecastItem : ${forecastModel.length}");
      isLoading = false;
      notifyListeners();
    }
  }

  Future<Position> determinePosition() async {
    isLoading = true;
    notifyListeners();
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  String returnMonth(DateTime date) {
    return DateFormat.MMMM().format(date);
  }
}
