import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.mediaQuery,
    required this.textEditingController,
    required this.onChanged,
    required this.searchText,
    required this.onPressed,
    required this.onFieldSubmitted,
  });

  final Size mediaQuery;
  final TextEditingController textEditingController;
  final String searchText;

  final Function(String)? onChanged;
  final Function()? onPressed;

  final Function(String) onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaQuery.height * .08,
      width: mediaQuery.width * .9,
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        cursorRadius: const Radius.circular(10),
        controller: textEditingController,
        onChanged: onChanged,
        cursorColor: Constants.primary,
        decoration: InputDecoration(
          prefixIconColor: const Color(0xff8C8C8C),
          hintText: searchText.tr(),
          filled: true,
          fillColor: Colors.white,
          focusColor: Constants.primary,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle: const TextStyle(
            color: Color(0xff8C8C8C),
            fontFamily: 'Cairo',
          ),
          prefixIcon: const Icon(
            Icons.search,
            size: 30,
          ),
          suffixIcon: Visibility(
            visible: textEditingController.text.length > 0,
            child: IconButton(
              icon: const Icon(
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
