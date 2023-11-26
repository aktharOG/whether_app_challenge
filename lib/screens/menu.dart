import 'package:flutter/material.dart';
import 'package:whether_app_challenge/helpers/svg_icon.dart';
import 'package:whether_app_challenge/widgets/heading_text.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.orange])),
      child: const Scaffold(
        //  backgroundColor: Colors.purpleAccent,
        backgroundColor: Colors.transparent,

        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadingText(
                    text: "Saved Locations",
                    fontSize: 20,
                  ),
                  SvgIcon(
                    path: "search_icon",
                    size: 40,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
