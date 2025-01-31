import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/core/database/session.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/features/language/cubit/current_data.dart';
import 'package:qismati/generated/l10n.dart';
import 'package:qismati/routes.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLangCode = 'ar'; // Default language is Arabic

  void onLangSelected(BuildContext context, String langCode) {
    setState(() {
      selectedLangCode = langCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CurrentDataCubit>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ContentContainer(
                color: CustomColors.languageContainerColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: const Text(
                        "Select language",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: CustomColors.languageTextColor,
                        ),
                      ),
                    ),
                    _buildLanguageOption(context, cubit, 'English', 'en'),
                    _buildLanguageOption(context, cubit, 'العربية', 'ar'),
                    _buildLanguageOption(context, cubit, 'አማርኛ', 'am'),
                    _buildLanguageOption(context, cubit, 'Afaan Oromoo', 'om'),
                    _buildLanguageOption(context, cubit, 'Soomaali', 'so'),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () {
                  Session objSession = Session();
                  objSession.setSession("local", selectedLangCode);

                  cubit.changeLocale(selectedLangCode);
                  context.go(Routes.onboarding);
                },
                // text: 'Next',
                text: S.of(context).next,
                shadowColor: CustomColors.shadowBlue,
                elevation: 5,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(BuildContext context, CurrentDataCubit cubit,
      String language, String langCode) {
    bool isSelected = selectedLangCode == langCode;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () => onLangSelected(context, langCode),
        child: Container(
          width: 200,
          height: 40,
          decoration: isSelected
              ? BoxDecoration(
                  color: isSelected ? CustomColors.primary : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: isSelected
                      ? Border.all(color: CustomColors.primary, width: 2)
                      : null,
                )
              : null,
          alignment: Alignment.center,
          child: Text(
            language,
            style: TextStyle(
              color: isSelected ? CustomColors.languageTextColor : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
