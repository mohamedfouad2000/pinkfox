import 'package:flutter/material.dart';
import 'package:pinkfox/core/utils/colors.dart';

Widget defaultButton({
  required VoidCallback fun,
  required textWidget,
  required Color c,
  double radius = 20,
  double height = 46,
  double width = double.infinity,
  BorderRadiusGeometry? borderRadius,
}) =>
    InkWell(
      onTap: () {
        fun();
      },
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: c,
          borderRadius: borderRadius ??
              BorderRadius.circular(
                radius,
              ),
          border: Border.all(
            color: ColorsData.kMainColor, //                   <--- border color
          ),
        ),
        child: Center(
          child: textWidget,
        ),
      ),
    );

Widget customTextFiled(
        {required TextEditingController controller,
        TextInputType type = TextInputType.name,
        Widget? prefixIcon,
        var ontapFun,
        String? hintText,
        bool enabled = true,
        Function(String)? onChanged,
        double rad = 10,
        int maxLines = 1}) =>
    TextField(
      enabled: enabled,
      controller: controller,
      onTap: ontapFun,
      onSubmitted: (v) {
        ontapFun;
      },
      maxLines: maxLines,
      onChanged: onChanged,
      keyboardType: type,
      // style: StylesData.font14.copyWith(color: kMainColor),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        // hintStyle: StylesData.font14.copyWith(color: const Color(0x330D223F)),

        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorsData.kMainColor),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        // labelText: 'Password',
      ),
    );
Widget customTextFormedFiled({
  required controller,
  TextInputType type = TextInputType.name,
  Widget? preicon,
  bool obscureText = false,
  bool enabled = true,
  String val = "",
  Widget? sufficon,
  String? hintText,
  Function(String)? onChanged,
  Function()? onTap,
  var sufFunction,
  double rad = 10,
  maxLines = 1,
  // required void Function()? onPressed,
}) =>
    TextFormField(
      onChanged: onChanged,
      enabled: enabled,
      onTap: onTap,
      controller: controller,
      obscureText: obscureText,
      keyboardType: type,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return '';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      // style: StylesData.font14.copyWith(color: kMainColor),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintText: hintText,
        prefixIcon: preicon,
        suffixIcon: sufficon,
        // hintStyle: StylesData.font14.copyWith(color: const Color(0x330D223F)),
        focusedBorder: OutlineInputBorder(
          // borderSide: BorderSide(width: 1, color: kMainColor),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),

        // labelText: 'Password',
      ),
    );

dynamic navigatorPush(context, page) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (builder) => page),
  );
}

dynamic navpushAndRemove(context, page) {
  return Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (builder) => page), (route) => false);
}
