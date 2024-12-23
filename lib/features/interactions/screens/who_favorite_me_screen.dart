import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/models/person.dart';
import 'package:qismati/features/interactions/screens/interaction_screen.dart';
import 'package:qismati/features/interactions/screens/tips_screen.dart';
import 'package:qismati/routes.dart';

class WhoFavoritedMeScreen extends StatelessWidget {
  const WhoFavoritedMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractionScreen(
      onSelected: (index) {},
      onRefreshPressed: () {},
      onGuideButtonPressed: () {
        context.push(
          Routes.tips,
          extra: TipsExtra(
            routes: Routes.whoFavoritedMe,
            screenTitle: 'Who Favorited me?',
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
      screenTitle: 'Who Favorited me?',
      menuOptions: const [
        'Member Profile',
      ],
    );
  }
}
