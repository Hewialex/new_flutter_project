import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/features/contactus/widgets/stylish_title.dart';
import 'package:qismati/features/signup/widgets/description_text_field.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ContentContainer(
            child: Column(
              children: [
                const CustomTopBar(
                  excludeBackButton: false,
                  excludeLangDropDown: true,
                ),
                Text(
                  'Contact us',
                  style: GoogleFonts.kodchasan(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25.sp,
                      color: CustomColors.headingGray,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                const StyledTitle(title: 'Contact Us'),
                SizedBox(height: 35.h),

                Form(
                  key: formKey,
                  child: Column(
                    children: [

                      // email address
                      CustomTextField(
                        text: "abc@gmail.com",
                        controller: TextEditingController(),
                        // this is from the firebase auth not from user hence readonly
                        readOnly: true,
                      ),

                      SizedBox(height: 15.h),

                      // subject
                      CustomTextField(
                        text: "Subject",
                        controller: TextEditingController(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15.h),

                      // message text area
                      DescriptionTextField(
                        controller: TextEditingController(),
                        placeholder: "Type your message",
                      ),

                      SizedBox(height: 65.h),

                      // send button
                      CustomButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            // send the message
                          }
                        },
                        text: 'Send',
                        shadowColor: CustomColors.shadowBlue,
                        elevation: 5,
                        fontWeight: FontWeight.w600,
                      ),

                      SizedBox(height: 65.h),

                    ],
                  ),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
