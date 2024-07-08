import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinkfox/core/utils/assets_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinkfox/core/utils/size_config.dart';
import 'package:pinkfox/core/utils/styles.dart';

class Screen1ViewBody extends StatelessWidget {
  const Screen1ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350,
          // 
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(AssetsData.patient),
                // width: 226,
                height: 226,
              ),
              Text("PinkFox", style: StylesData.font35),
            ],
          ),
        ),
        Text("Welcome To PinkFox ", style: StylesData.font25),
        Text("Detecting Breast Cancer with ", style: StylesData.font15),
        Text("Mobile Application", style: StylesData.font15),
      ],
    );
  }
}
