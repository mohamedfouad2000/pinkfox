import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinkfox/core/utils/assets_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinkfox/core/utils/colors.dart';
import 'package:pinkfox/core/utils/components.dart';
import 'package:pinkfox/core/utils/size_config.dart';
import 'package:pinkfox/core/utils/styles.dart';

class Screen3ViewBody extends StatelessWidget {
  const Screen3ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(),
        CircleAvatar(
          backgroundColor: ColorsData.kMainColor,
          radius: 96,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Positive Or",
                style: StylesData.fontInter15.copyWith(fontSize: 16),
              ),
              Text(
                "Negative",
                style: StylesData.fontInter15.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        // const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: defaultButton(
              fun: () {
                Navigator.pop(context);
                // navigatorPush(context, const Screen3View());
              },
              textWidget: Center(
                child: FittedBox(
                    child: Text(
                  "Back",
                  style: StylesData.font20,
                )),
              ),
              c: ColorsData.kMainColor),
        )
      ],
    );
  }
}
