import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled({
    super.key,
    required this.textEditingController,
    required this.onChanged,
    required this.searchText,
    required this.onPressed,
    required this.onFieldSubmitted,
  });

  final TextEditingController textEditingController;
  final String searchText;

  final Function(String)? onChanged;
  final Function()? onPressed;

  final Function(String) onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Device.orientation == Orientation.portrait ? 8.0.h : 8.0.w,
      width: 90.0.w,
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        cursorRadius: Radius.circular(10),
        controller: textEditingController,
        onChanged: onChanged,
        cursorColor: Constants.primary,
        decoration: InputDecoration(
          prefixIconColor: Color(0xff8C8C8C),
          hintText: searchText.tr(),
          filled: true,
          fillColor: Colors.white,
          focusColor: Constants.primary,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle: TextStyle(
            color: Color(0xff8C8C8C),
            fontFamily: 'Cairo',
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 20.sp,
          ),
          suffixIcon: Visibility(
            visible: textEditingController.text.length > 0,
            child: IconButton(
              icon: Icon(
                Icons.clear,
                color: Constants.primary,
              ),
              onPressed: onPressed,
            ),
          ),
        ),
      ),
    );
  }
}
