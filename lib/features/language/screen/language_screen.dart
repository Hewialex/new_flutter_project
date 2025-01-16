import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/core/database/session.dart';
import 'package:qismati/features/language/cubit/current_data.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  void onLangSelected(
      BuildContext context, CurrentDataCubit cubit, String locale) {
    Session objSession = Session();
    objSession.setSession("local", locale);

    cubit.changeLocale(locale);
    // TODO: nav to next screen here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg2.png"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.only(top: 50.0),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: const Text(
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: CustomColors.primary,
                ),
              ),
            ),
            BlocBuilder<CurrentDataCubit, CurrentDataState>(
              builder: (context, state) {
                final cubit = context.read<CurrentDataCubit>();
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton(
                        onPressed: () => onLangSelected(context, cubit, 'en'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.primary,
                          fixedSize: const Size(200, 40),
                        ),
                        child: const Text(
                          "English",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.background,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton(
                        onPressed: () => onLangSelected(context, cubit, 'ar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.primary,
                          fixedSize: const Size(200, 40),
                        ),
                        child: const Text(
                          "Arabic",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.background,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton(
                        onPressed: () => onLangSelected(context, cubit, 'am'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.primary,
                          fixedSize: const Size(200, 40),
                        ),
                        child: const Text(
                          "Amharic",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.background,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton(
                        onPressed: () => onLangSelected(context, cubit, 'om'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.primary,
                          fixedSize: const Size(200, 40),
                        ),
                        child: const Text(
                          "Oromo",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.background,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton(
                        onPressed: () => onLangSelected(context, cubit, 'so'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.primary,
                          fixedSize: const Size(200, 40),
                        ),
                        child: const Text(
                          "Somali",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.background,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
