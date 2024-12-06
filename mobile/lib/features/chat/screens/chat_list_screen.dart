import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_list_card.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/common/widgets/nav_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/features/chat/bloc/chat_list_bloc.dart';
import 'package:qismati/routes.dart';

class _DynamicChatListContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ChatListBloc>();
    final state = bloc.state;

    switch (state) {
      case ChatListInitial():
        bloc.add(GetChatList());
        return const Center(
          child: CupertinoActivityIndicator(
            color: CustomColors.primary,
          ),
        );
      case ChatListLoading():
        return const Center(
          child: CupertinoActivityIndicator(
            color: CustomColors.primary,
          ),
        );
      case ChatListLoaded():
        return Flexible(
          child: SingleChildScrollView(
              child: Column(
            children: state.chatListModel
                .map(
                  (e) => CustomListCard(
                    mainText: e.otherUser.fullName,
                    subText: '${e.otherUser.age} years old',
                    leading: ClipOval(
                      child: Center(
                        child: Image.asset(
                          e.otherUser.gender == "male"
                              ? "assets/images/male_avatar.png"
                              : "assets/images/female_avatar.png",
                        ),
                      ),
                    ),
                    bottomRightWidget: Padding(
                      padding: EdgeInsets.only(bottom: 13.h, right: 10.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: CustomColors.primary,
                            size: 11.sp,
                          ),
                          Text(
                            e.otherUser.country,
                            style: GoogleFonts.lexend(
                              textStyle: TextStyle(
                                color: CustomColors.textGray,
                                fontWeight: FontWeight.w300,
                                fontSize: 9.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      context.push(Routes.chat);
                    },
                  ),
                )
                .toList(),
          )),
        );
      case ChatListError():
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Failed to load chats'),
            Text('Error message: ${state.errorMessage}'),
            TextButton(
              onPressed: () {
                bloc.add(GetChatList());
              },
              child: const Text('Retry'),
            )
          ],
        );
      default:
        return Text('Unimplemented state $state');
    }
  }
}

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      bottomNavigationBar: const NavBar(currentIndex: 2),
      body: SafeArea(
        child: ContentContainer(
          child: Column(
            children: [
              CustomTopBar(
                excludeBackButton: true,
                excludeLangDropDown: true,
                altIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: CustomColors.primary,
                  ),
                ),
              ),
              SizedBox(height: 26.h),
              Text(
                'My inbox',
                style: GoogleFonts.kodchasan(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25.sp,
                    color: CustomColors.headingGray,
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Text(
                'Conversation',
                style: GoogleFonts.lexend(
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 15.w),
              _DynamicChatListContent(),
            ],
          ),
        ),
      ),
    );
  }
}
