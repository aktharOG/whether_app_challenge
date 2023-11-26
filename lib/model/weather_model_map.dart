// To parse this JSON data, do
//
//     final weatherModelMap = weatherModelMapFromJson(jsonString);

import 'dart:convert';

WeatherModelMap weatherModelMapFromJson(String str) => WeatherModelMap.fromJson(json.decode(str));

String weatherModelMapToJson(WeatherModelMap data) => json.encode(data.toJson());

class WeatherModelMap {
    Query query;

    WeatherModelMap({
        required this.query,
    });

    factory WeatherModelMap.fromJson(Map<String, dynamic> json) => WeatherModelMap(
        query: Query.fromJson(json["query"]),
    );

    Map<String, dynamic> toJson() => {
        "query": query.toJson(),
    };
}

class Query {
    String customId;
    String q;
    Location location;
    Current current;

    Query({
        required this.customId,
        required this.q,
        required this.location,
        required this.current,
    });

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        customId: json["custom_id"],
        q: json["q"],
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
    );

    Map<String, dynamic> toJson() => {
        "custom_id": customId,
        "q": q,
        "location": location.toJson(),
        "current": current.toJson(),
    };
}

class Current {
    String lastUpdatedEpoch;
    String lastUpdated;
    String tempC;
    String tempF;
    String isDay;
    Condition condition;
    String windMph;
    String windKph;
    String windDegree;
    String windDir;
    String pressureMb;
    String pressureIn;
    String precipMm;
    String precipIn;
    String humidity;
    String cloud;
    String feelslikeC;
    String feelslikeF;
    String visKm;
    String visMiles;
    String uv;
    String gustMph;
    String gustKph;

    Current({
        required this.lastUpdatedEpoch,
        required this.lastUpdated,
        required this.tempC,
        required this.tempF,
        required this.isDay,
        required this.condition,
        required this.windMph,
        required this.windKph,
        required this.windDegree,
        required this.windDir,
        required this.pressureMb,
        required this.pressureIn,
        required this.precipMm,
        required this.precipIn,
        required this.humidity,
        required this.cloud,
        required this.feelslikeC,
        required this.feelslikeF,
        required this.visKm,
        required this.visMiles,
        required this.uv,
        required this.gustMph,
        required this.gustKph,
    });

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"].toString(),
        lastUpdated: json["last_updated"].toString(),
        tempC: json["temp_c"].toString(),
        tempF: json["temp_f"]?.toString()??'',
        isDay: json["is_day"].toString(),
        condition: Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"]?.toString()??'',
        windKph: json["wind_kph"]?.toString()??'',
        windDegree: json["wind_degree"].toString(),
        windDir: json["wind_dir"].toString(),
        pressureMb: json["pressure_mb"].toString(),
        pressureIn: json["pressure_in"]?.toString()??'',
        precipMm: json["precip_mm"].toString(),
        precipIn: json["precip_in"].toString(),
        humidity: json["humidity"].toString(),
        cloud: json["cloud"].toString(),
        feelslikeC: json["feelslike_c"]?.toString()??'',
        feelslikeF: json["feelslike_f"]?.toString()??'',
        visKm: json["vis_km"].toString(),
        visMiles: json["vis_miles"].toString(),
        uv: json["uv"].toString(),
        gustMph: json["gust_mph"]?.toString()??"",
        gustKph: json["gust_kph"]?.toString()??"",
    );

    Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch.toString(),
        "last_updated": lastUpdated.toString(),
        "temp_c": tempC.toString(),
        "temp_f": tempF.toString(),
        "is_day": isDay.toString(),
        "condition": condition.toJson(),
        "wind_mph": windMph.toString(),
        "wind_kph": windKph.toString(),
        "wind_degree": windDegree.toString(),
        "wind_dir": windDir.toString(),
        "pressure_mb": pressureMb.toString(),
        "pressure_in": pressureIn.toString(),
        "precip_mm": precipMm.toString(),
        "precip_in": precipIn.toString(),
        "humidity": humidity.toString(),
        "cloud": cloud.toString(),
        "feelslike_c": feelslikeC.toString(),
        "feelslike_f": feelslikeF,
        "vis_km": visKm.toString(),
        "vis_miles": visMiles.toString(),
        "uv": uv,
        "gust_mph": gustMph.toString(),
        "gust_kph": gustKph.toString(),
    };
}

class Condition {
    String text;
    String icon;
    String code;

    Condition({
        required this.text,
        required this.icon,
        required this.code,
    });

    factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"].toString(),
        icon: json["icon"].toString(),
        code: json["code"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "text": text.toString(),
        "icon": icon.toString(),
        "code": code.toString(),
    };
}

class Location {
    String name;
    String region;
    String country;
    String lat;
    String lon;
    String tzId;
    String localtimeEpoch;
    String localtime;

    Location({
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.tzId,
        required this.localtimeEpoch,
        required this.localtime,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"].toString(),
        region: json["region"].toString(),
        country: json["country"].toString(),
        lat: json["lat"]?.toString()??'',
        lon: json["lon"]?.toString()??'',
        tzId: json["tz_id"].toString(),
        localtimeEpoch: json["localtime_epoch"].toString(),
        localtime: json["localtime"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "name": name.toString(),
        "region": region.toString(),
        "country": country.toString(),
        "lat": lat.toString(),
        "lon": lon.toString(),
        "tz_id": tzId.toString(),
        "localtime_epoch": localtimeEpoch.toString(),
        "localtime": localtime.toString(),
    };
}
