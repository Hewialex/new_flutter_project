import 'package:flutter/material.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/nav_bar.dart';
import 'package:qismati/features/notification/model/notification_model.dart';

class NotificationDetailScreen extends StatelessWidget {
  final NotificationModel notification;
  const NotificationDetailScreen({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      bottomNavigationBar: const NavBar(currentIndex: 0),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: CustomColors.primary,
        iconTheme: const IconThemeData(
          color: CustomColors.background,
        ),
        title: Text(
          notification.title,
          style: const TextStyle(
            color: CustomColors.background,
          ),
        ),
        elevation: 0,
      ),
      body: const SafeArea(
        child: Text("notification.data[]"),
      ),
    );
  }
}
