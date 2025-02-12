import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/models/person.dart';
import 'package:qismati/features/interactions/screens/interaction_screen.dart';
import 'package:qismati/features/interactions/screens/tips_screen.dart';
import 'package:qismati/routes.dart';
import 'package:qismati/generated/l10n.dart';

class IgnoreListScreen extends StatelessWidget {
  const IgnoreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);
    return InteractionScreen(
      onSelected: (index) {},
      onRefreshPressed: () {},
      onGuideButtonPressed: () {
        context.push(
          Routes.tips,
          extra: TipsExtra(
            routes: Routes.ignore,
            screenTitle: localizations.ignoreList,
          ),
        );
      },
      people: List.generate(2, (_) {
        return Person(
          name: 'Saba Ashfaq',
          image: 'assets/images/female_avatar.png',
          age: 20,
          locationName: 'Pakistan',
          isPremium: false,
        );
      }),
      screenTitle: localizations.ignoreList,
      menuOptions: [
        localizations.memberProfile,
        localizations.deleteFromIgnoreList,
        localizations.cancel,
      ],
    );
  }
}
