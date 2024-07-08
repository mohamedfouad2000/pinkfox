import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:pinkfox/Feature/screen3/presentation/views/screen3_view.dart';
import 'package:pinkfox/Feature/screen4/presentation/views/screen4_view.dart';
import 'package:pinkfox/core/utils/assets_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinkfox/core/utils/colors.dart';
import 'package:pinkfox/core/utils/components.dart';
import 'package:pinkfox/core/utils/size_config.dart';
import 'package:pinkfox/core/utils/styles.dart';

class Screen2ViewBody extends StatelessWidget {
  const Screen2ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: SizeConfig.screenHeight! * .66,
          width: double.infinity,
          child: const Image(
            fit: BoxFit.cover,
            image: AssetImage(
              AssetsData.fram1,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text("Upload Your Image", style: StylesData.font24),
        Text("Upload Your Image To ", style: StylesData.fontInter15),
        Text("Detect If you Have", style: StylesData.fontInter15),
        Text("Cancer or not", style: StylesData.fontInter15),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: defaultButton(
              fun: () async {
                final PermissionState ps = await PhotoManager
                    .requestPermissionExtend(); // the method can use optional param `permission`.
                if (ps.isAuth) {
                  navigatorPush(context, const Screen4View());

                  // Granted
                  // You can to get assets here.
                }
                // } else if (ps.hasAccess) {
                //   // Access will continue, but the amount visible depends on the user's selection.
                // } else {
                //   // Limited(iOS) or Rejected, use `==` for more precise judgements.
                //   // You can call `PhotoManager.openSetting()` to open settings for further steps.
                // }
              },
              textWidget: Center(
                child: FittedBox(
                  child: Icon(
                    Icons.upload,
                    color: Colors.black.withOpacity(.6),
                    size: 45,
                  ),
                ),
              ),
              c: ColorsData.kMainColor),
        )
      ],
    );
  }
}
