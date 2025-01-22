import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_text_field.dart';
import 'package:qismati/generated/l10n.dart';

class PhoneNumberInput extends StatelessWidget {
  final TextEditingController phoneNumberController;
  final String? Function(String?) validator;
  final ValueChanged<String> onCountryCodeChanged;

  const PhoneNumberInput({
    super.key,
    required this.phoneNumberController,
    required this.onCountryCodeChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);
    return SizedBox(
      width: 318.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: CustomColors.textFieldBackground,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: CountryCodePicker(
              padding: const EdgeInsets.symmetric(vertical: 4),
              onChanged: (countryCode) {
                onCountryCodeChanged(countryCode.dialCode ?? '');
              },
              showDropDownButton: true,
              initialSelection: 'ET',
              favorite: const ['+251', 'ET'],
              showFlag: false,
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: CustomTextField(
              text: localizations.phone_number,
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              validator: validator,
              maxChar: 50,
            ),
          )
        ],
      ),
    );
  }
}
