import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pinkfox/Feature/screen3/presentation/views/widgets/screen3_view_body.dart';
import 'package:pinkfox/core/utils/colors.dart';

class Screen3View extends StatelessWidget {
  const Screen3View({super.key,  this.image, this.imageFile});
 final File? imageFile;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.kbackColor,
      body:  SafeArea(child: Screen3ViewBody(image : image, imageFile: imageFile)),
    );
  }
}
