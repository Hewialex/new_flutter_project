import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/widgets/custom_dropdown_menu.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/features/signup/widgets/text_field_info.dart';

class BasicSection extends StatelessWidget {
  const BasicSection({
    super.key,
    required this.nationality,
    required this.usernameController,
    required this.fullNameController,
    required this.phoneNumberController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.nationalityController,
    required this.countryController,
    required this.cityController,
  });

  final List<String> nationality;
  final TextEditingController usernameController;
  final TextEditingController fullNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController nationalityController;
  final TextEditingController countryController;
  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          text: "Username",
          controller: usernameController,
        ),
        SizedBox(height: 21.h),
        const TextFieldInfo(
          info:
              'The user name is the nick name that appears to all members it must be decent and respectfull, and it can’t exceed 15 characters.',
        ),
        SizedBox(height: 41.h),
        CustomTextField(
          text: "Full name",
          controller: fullNameController,
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          text: "Phone Number",
          controller: phoneNumberController,
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          text: "Email",
          controller: emailController,
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          text: "Password",
          obsecureText: true,
          controller: passwordController,
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          text: "Confirm Password",
          obsecureText: true,
          controller: confirmPasswordController,
        ),
        const TextFieldInfo(
          info:
              'It must at least 6 characters long and must not contain special characters.',
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: nationality,
          controller: nationalityController,
          hintText: "Nationality",
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: nationality,
          controller: countryController,
          hintText: "Country",
        ),
        SizedBox(height: 20.h),
        CustomDropdownMenu(
          values: nationality,
          controller: cityController,
          hintText: "City",
        ),
      ],
    );
  }
}
