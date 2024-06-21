import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:pinkfox/Feature/screen4/presentation/views/widgets/screen4_view_body.dart';
import 'package:pinkfox/core/utils/colors.dart';

class Screen4View extends StatelessWidget {
  const Screen4View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.kbackColor,
      body: const SafeArea(child: Screen4ViewBody()),
    );
  }
}
