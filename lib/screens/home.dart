import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whether_app_challenge/helpers/data.dart';
import 'package:whether_app_challenge/helpers/navigation_helper.dart';
import 'package:whether_app_challenge/helpers/svg_icon.dart';
import 'package:whether_app_challenge/provider/home_provider.dart';
import 'package:whether_app_challenge/screens/menu.dart';
import 'package:whether_app_challenge/widgets/heading_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      homePro.getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final homePro = Provider.of<HomeProvider>(context);
    return RefreshIndicator(
      onRefresh: () async {
        await homePro.getCurrentLocation();
      },
      child: Scaffold(
        body: homePro.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : PageView.builder(
                itemCount: bgImages.length,
                itemBuilder: (BuildContext ctx, int index) => Scaffold(
                    body: Stack(
                  children: [
                    Image.asset(
                      bgImages[index],
                      fit: BoxFit.cover,
                      height: height,
                    ),
                    Container(
                      height: height,
                      color: const Color.fromARGB(80, 0, 0, 0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_sharp,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        HeadingText(
                                          text:
                                              "${homePro.weatherModelMap!.query.location.name}",
                                          fontSize: 25,
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print("object");
                                        push(context, const MenuScreen());
                                      },
                                      child: const SvgIcon(
                                        path: "Menu Icon",
                                        size: 40,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                HeadingText(
                                  text: homePro.returnMonth(DateTime.parse(
                                      homePro.weatherModelMap!.query.location
                                          .localtime)),
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                HeadingText(
                                  text:
                                      "Updated as of ${homePro.weatherModelMap!.query.location.localtime}",
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                HeadingText(
                                  text: homePro.weatherModelMap!.query.current
                                      .condition.text,
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: HeadingText(
                                        text: homePro.weatherModelMap!.query
                                            .current.tempC,
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: HeadingText(
                                        text: "ºC",
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        const SvgIcon(
                                          path: "Icon Humidity",
                                          size: 40,
                                        ),
                                        const HeadingText(
                                          text: "HUMIDITY",
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        HeadingText(
                                          text:
                                              "${homePro.weatherModelMap!.query.current.humidity}%",
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const SvgIcon(
                                          path: "Icon Wind",
                                          size: 40,
                                        ),
                                        const HeadingText(
                                          text: "WIND",
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        HeadingText(
                                          text:
                                              "${homePro.weatherModelMap!.query.current.windDegree}%",
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const SvgIcon(
                                          path: "Icon Feels Like",
                                          size: 40,
                                        ),
                                        const HeadingText(
                                          text: "FEELS LIKE",
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        HeadingText(
                                          text:
                                              "${homePro.weatherModelMap!.query.current.feelslikeC}%",
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(109, 158, 158, 158),
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      HeadingText(
                                        text: "Fri 18",
                                        fontSize: 18,
                                      ),
                                      Icon(
                                        Icons.cloud,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      HeadingText(
                                        text: "22º",
                                        fontSize: 18,
                                      ),
                                      HeadingText(
                                        text: "1-5\nkm/h",
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      HeadingText(
                                        text: "Fri 18",
                                        fontSize: 18,
                                      ),
                                      Icon(
                                        Icons.cloud,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      HeadingText(
                                        text: "22º",
                                        fontSize: 18,
                                      ),
                                      HeadingText(
                                        text: "1-5\nkm/h",
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      HeadingText(
                                        text: "Fri 18",
                                        fontSize: 18,
                                      ),
                                      Icon(
                                        Icons.cloud,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      HeadingText(
                                        text: "22º",
                                        fontSize: 18,
                                      ),
                                      HeadingText(
                                        text: "1-5\nkm/h",
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      HeadingText(
                                        text: "Fri 18",
                                        fontSize: 18,
                                      ),
                                      Icon(
                                        Icons.cloud,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      HeadingText(
                                        text: "22º",
                                        fontSize: 18,
                                      ),
                                      HeadingText(
                                        text: "1-5\nkm/h",
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ),
      ),
    );
  }
}
