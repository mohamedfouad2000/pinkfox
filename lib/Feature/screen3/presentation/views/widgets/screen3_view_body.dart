import 'dart:io';

import 'package:flutter/material.dart';

import 'package:pinkfox/core/utils/colors.dart';
import 'package:pinkfox/core/utils/components.dart';
import 'package:pinkfox/core/utils/styles.dart';

class Screen3ViewBody extends StatefulWidget {
  const Screen3ViewBody({super.key, this.image, this.imageFile});
  final File? imageFile;
  final String? image;

  @override
  State<Screen3ViewBody> createState() => _Screen3ViewBodyState();
}

class _Screen3ViewBodyState extends State<Screen3ViewBody> {
  late bool x;
  bool isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds:2 ), () async {
       if (widget.imageFile != null) {
      x = false;
    } else if (widget.image != null) {
      if (widget.image?.split('/').last.substring(1, 2) == 'p') {
        x = true;
      } else {
        x = false;
      }
    }
      
    }).then((value)  {
setState(() {
  isloading=false;
});
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return
    isloading ? const Center(child: CircularProgressIndicator()) :
     Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(),
        CircleAvatar(
          backgroundColor: ColorsData.kMainColor,
          radius: 96,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(x==true)
              Text(
                "Positive",
                style: StylesData.fontInter15.copyWith(fontSize: 16),
              ),
              if(x==false)
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
