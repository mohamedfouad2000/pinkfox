import 'package:flutter/material.dart';
import 'package:pinkfox/Feature/screen2/presentation/views/widgets/screen2_view_body.dart';
import 'package:pinkfox/core/utils/colors.dart';

class Screen2View extends StatelessWidget {
  const Screen2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.kbackColor,
      body: const SafeArea(child: Screen2ViewBody()),
    );
  }
}
