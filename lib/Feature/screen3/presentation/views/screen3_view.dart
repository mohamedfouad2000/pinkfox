import 'package:flutter/material.dart';
import 'package:pinkfox/Feature/screen3/presentation/views/widgets/screen3_view_body.dart';
import 'package:pinkfox/core/utils/colors.dart';

class Screen3View extends StatelessWidget {
  const Screen3View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.kbackColor,
      body: const SafeArea(child: Screen3ViewBody()),
    );
  }
}
