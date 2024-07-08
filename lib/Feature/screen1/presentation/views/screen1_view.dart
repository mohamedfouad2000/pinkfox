import 'package:flutter/material.dart';
import 'package:pinkfox/Feature/screen1/presentation/views/widgets/screen1_view_body.dart';
import 'package:pinkfox/Feature/screen2/presentation/views/screen2_view.dart';
import 'package:pinkfox/core/utils/colors.dart';
import 'package:pinkfox/core/utils/components.dart';

class Screen1View extends StatefulWidget {
  const Screen1View({super.key});

  @override
  State<Screen1View> createState() => _Screen1ViewState();
}

class _Screen1ViewState extends State<Screen1View> {
    //اول حاجه بتتنفد 

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      navpushAndRemove(context, const Screen2View());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.kMainColor,
      body: const SafeArea(child: Screen1ViewBody()),
    );
  }
}
