import 'package:banking/shared/Constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPaddingWidget extends StatelessWidget {
  final Widget child;
  const CustomPaddingWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(child: child),
    );
  }
}

class CustomTextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  const CustomTextFormFieldWidget({super.key, this.hintText, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.bgTextFormFeild,
        hintText: hintText ?? 'Unknown',
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 14.0),
        hintStyle: Theme.of(context).textTheme.titleMedium,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            alignment: Alignment.centerRight,
            child: suffixIcon,
          ),
        ),
      ),
    );
  }
}

class CustomTitleTextFormFieldWidget extends StatelessWidget {
  final String title;
  const CustomTitleTextFormFieldWidget({super.key, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
