import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/common/widgets/nav_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/common/widgets/custom_list_card.dart';
import 'package:qismati/features/notification/bloc/notification_bloc.dart';
import 'package:qismati/features/notification/model/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      bottomNavigationBar: const NavBar(currentIndex: 0),
      body: SafeArea(
        child: ContentContainer(
          child: Column(
            children: [
              _buildTopBar(),
              SizedBox(height: 26.h),
              _buildTitle(),
              SizedBox(height: 28.h),
              Expanded(
                child: BlocBuilder<NotificationBloc, NotificationState>(
                  builder: (context, state) {
                    if (state is NotificationInitial) {
                      context.read<NotificationBloc>().add(NotificationLoad());
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is NotificationSuccess) {
                      return _buildNotificationList(
                        context,
                        state.notifications,
                        state.hasReachedMax,
                      );
                    } else if (state is NotificationLoadingState) {
                      return _buildNotificationList(
                        context,
                        state.notifications,
                        false, // Still loading, so `hasReachedMax` is false
                        isLoading: true,
                      );
                    } else {
                      return _buildErrorState(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return CustomTopBar(
      excludeBackButton: false,
      excludeLangDropDown: true,
      altIcon: Row(
        children: [
          _buildCircleIcon(
            icon: Icons.delete_outline,
            tooltip: "Clear All",
            onPressed: () {},
          ),
          SizedBox(width: 6.w),
          _buildCircleIcon(
            icon: Icons.settings_outlined,
            tooltip: "Settings",
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Notification',
      style: GoogleFonts.lexend(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 25.sp,
          color: CustomColors.headingGray,
        ),
      ),
    );
  }

  Widget _buildNotificationList(
    BuildContext context,
    List<NotificationModel> notifications,
    bool hasReachedMax, {
    bool isLoading = false,
  }) {
    return ListView.builder(
      itemCount: notifications.length + 1,
      itemBuilder: (context, index) {
        if (index == notifications.length) {
          return hasReachedMax
              ? const SizedBox()
              : _buildLoadMoreButton(context, isLoading);
        }
        return _buildNotificationItem(context, notifications[index]);
      },
    );
  }

  Widget _buildNotificationItem(
      BuildContext context, NotificationModel notification) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: Key(notification.id.toString()),
        direction: DismissDirection.startToEnd,
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: (direction) {
          context.read<NotificationBloc>().add(NotificationRead(notification));
        },
        child: CustomListCard(
          leading: const Icon(Icons.mail, color: CustomColors.primary),
          iconButton: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
          name: notification.title,
          age: 20,
          excludeTextTime: true,
          recentTextTime: DateTime.now(),
          locationName: "",
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildLoadMoreButton(BuildContext context, bool isLoading) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading
            ? const SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(),
              )
            : ElevatedButton(
                onPressed: () {
                  context.read<NotificationBloc>().add(NotificationLoadMore());
                },
                child: const Text("Load More"),
              ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Error loading notifications'),
          IconButton(
            onPressed: () {
              context.read<NotificationBloc>().add(NotificationLoad());
            },
            tooltip: "Retry",
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleIcon({
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: CustomColors.primary,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: CustomColors.secondaryBackground),
        tooltip: tooltip,
      ),
    );
  }
}
