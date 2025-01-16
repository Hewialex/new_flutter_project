import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/generated/l10n.dart';

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
    final localizations = S.of(context);
    return Column(
      children: [
        SizedBox(height: 20.h),
        // CustomDropdownMenu(
        //   values: widget.nationality, // All nationalities (countries)
        //   controller: widget.nationalityController,
        //   hintText: "Nationality",
        // ),
        // SizedBox(height: 20.h),
        // CustomDropdownMenu(
        //   values: const ['ad', 'sam'], // List of countries
        //   controller: widget.countryController,
        //   hintText: "Country",
        //   onChanged: (value) {
        //     updateCities(value ?? '');
        //     widget.countryController.text = value ?? '';
        //   },
        // ),
        // SizedBox(height: 20.h),
        // CustomDropdownMenu(
        //   values: cities, // Cities based on selected country
        //   controller: widget.cityController,
        //   hintText: "City",
        // ),
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
            /* countryDropdownLabel: "*Country",
          stateDropdownLabel: "*State",
          cityDropdownLabel: "*City",*/
            //dropdownDialogRadius: 30,
            //searchBarRadius: 30,
          ),
        ),
      ],
    );
  }
}
