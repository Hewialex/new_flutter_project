import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({
    super.key,
    required this.nationalityController,
    required this.countryController,
    required this.cityController,
  });

  final TextEditingController nationalityController;
  final TextEditingController countryController;
  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        SizedBox(
          width: 318.w,
          // height: 50.h,
          child: CSCPicker(
            disabledDropdownDecoration: const BoxDecoration(
              color: CustomColors.textFieldBackground,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            dropdownDecoration: const BoxDecoration(
              color: CustomColors.textFieldBackground,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            layout: Layout.vertical,
            flagState: CountryFlag.DISABLE,
            onCountryChanged: (country) {
              nationalityController.text = country;
            },
            onStateChanged: (state) {
              countryController.text = state ?? '';
            },
            onCityChanged: (city) {
              cityController.text = city ?? '';
            },
            countryDropdownLabel: "Nationality",
            stateDropdownLabel: "Country",
          ),
        ),
      ],
    );
  }
}
