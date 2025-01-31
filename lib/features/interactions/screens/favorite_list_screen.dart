import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/models/person.dart';
import 'package:qismati/features/interactions/screens/interaction_screen.dart';
import 'package:qismati/features/interactions/screens/tips_screen.dart';
import 'package:qismati/routes.dart';
import 'package:qismati/generated/l10n.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({super.key});

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
            routes: Routes.favorite,
            screenTitle: localizations.favoriteList,
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
      screenTitle: localizations.favoriteList,
      menuOptions: [
        localizations.memberProfile,
        localizations.deleteFromFavorites,
        localizations.cancel,
      ],
    );
  }
}
