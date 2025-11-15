import 'package:banking/shared/Constants/app_colors.dart';
import 'package:banking/shared/Constants/app_sizebox.dart';
import 'package:banking/shared/Constants/string.dart';
import 'package:banking/shared/widget/core_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomPaddingWidget(
          child: Column(
            children: [
              AppSizeBox.kHeight50,
              Center(
                child: Text(
                  'Sign In',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              AppSizeBox.kHeight10,
              Center(
                child: Text(
                  'Hi! Welcome back, you`ve been missed',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontSize: 14),
                ),
              ),
              AppSizeBox.kHeight40,
              CustomTitleTextFormFieldWidget(title: "Email"),
              AppSizeBox.kHeight10,
              CustomTextFormFieldWidget(hintText: "visal@gmail.com"),
              AppSizeBox.kHeight20,
              CustomTitleTextFormFieldWidget(title: "Password"),
              AppSizeBox.kHeight10,
              CustomTextFormFieldWidget(
                hintText:
                    "\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022",
                suffixIcon: HugeIcon(
                  icon: HugeIcons.strokeRoundedViewOffSlash,
                  size: 25,
                  color: AppColors.titleLarge,
                ),
              ),
              AppSizeBox.kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      color: AppColors.primary,
                      decorationColor: AppColors.primary,
                      decorationThickness: 1.5,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              AppSizeBox.kHeight40,
              CustomElevatedButtonWidget(child: Text('Sign In')),
              AppSizeBox.kHeight40,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.titleSmall,
                        endIndent: 10,
                        indent: 0,
                        height: 1,
                      ),
                    ),
                    Text(
                      'Or sign in with',
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(fontSize: 14),
                    ),
                    Flexible(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.titleSmall,
                        indent: 10,
                        endIndent: 0,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              AppSizeBox.kHeight40,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.titleSmall,
                          width: 0.5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          AppStrings.appleIcon,
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.titleSmall,
                          width: 0.5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          AppStrings.facebookIcon,
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.titleSmall,
                          width: 0.5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          AppStrings.googleIcon,
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppSizeBox.kHeight40,
              RichText(text: TextSpan(
                text: "Don`t have an account? ",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontSize: 14),
                children: [
                  TextSpan(
                    text: "Sign Up",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          color: AppColors.primary,
                          decorationColor: AppColors.primary,
                          decorationThickness: 1.5,
                        ),
                  ),
                ],
              )),
              AppSizeBox.kHeight20,  
            ],
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButtonWidget extends StatelessWidget {
  final Widget? child;
  final Color? overlayColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const CustomElevatedButtonWidget({
    super.key,
    this.child,
    this.overlayColor = AppColors.onPrimary,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(overlayColor),
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        foregroundColor: WidgetStateProperty.all(foregroundColor),
        textStyle: WidgetStateProperty.all(
          Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        minimumSize: WidgetStateProperty.all(Size(double.infinity, 50)),
      ),
      child: child,
    );
  }
}
