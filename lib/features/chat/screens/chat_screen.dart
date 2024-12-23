import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/features/auth/widgets/content_container.dart';
import 'package:qismati/features/chat/bloc/chat_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ChatBloc>();

    bloc.add(GiveMeData(id: '1234'));
    return BlocConsumer<ChatBloc, ChatState>(
        builder: (context, state) {
          switch (state) {
            case ChatInitial():
              bloc.add(GiveMeData(id: '1234'));
              return const Scaffold(
                backgroundColor: CustomColors.background,
                body: Center(
                  child: CupertinoActivityIndicator(
                    color: CustomColors.primary,
                  ),
                ),
              );
            case ChatLoading():
              return const Scaffold(
                backgroundColor: CustomColors.background,
                body: Center(
                  child: CupertinoActivityIndicator(
                    color: CustomColors.primary,
                  ),
                ),
              );
            case ChatNotice():
              return Scaffold(
                backgroundColor: CustomColors.background,
                body: SafeArea(
                    child: ContentContainer(
                        child: Column(
                  children: [
                    ChatTopSection(
                      imageUrl: 'assets/images/female_avatar.png',
                      menuOnPressed: () {},
                      name: 'Albert Flores',
                    ),
                    ChatNoticeCard(
                      onPressed: () => bloc.add(AcceptChatNotice(id: '1234')),
                    ),
                  ],
                ))),
              );
            case ChatDefault():
              return Scaffold(
                backgroundColor: CustomColors.background,
                body: SafeArea(
                    child: ContentContainer(
                        child: Column(
                  children: [
                    ChatTopSection(
                      imageUrl: 'assets/images/female_avatar.png',
                      menuOnPressed: () {},
                      name: 'Albert Flores',
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            state.chatText.length, // Example chat message count
                        itemBuilder: (context, index) {
                          final chatBubble = state.chatText[index];
                          return ChatBubble(
                            textTime: chatBubble.textTime,
                            bubbleContent: chatBubble.bubbleContent,
                            isSender: chatBubble.isSender,
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 10, top: 10),
                        height: 60,
                        width: double.infinity,
                        color: Colors.white,
                        child: Row(
                          children: [
                            const SizedBox(
                              height: 30,
                              width: 45,
                            ),
                            Expanded(
                              child: TextField(
                                controller: state.messageController,
                                decoration: const InputDecoration(
                                  hintText: "Write a message...",
                                  hintStyle: TextStyle(color: Colors.black54),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: InkWell(
                                onTap: () {
                                  bloc.add(SendText());
                                },
                                child: Container(
                                  width: 47.w,
                                  height: 47.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.primary,
                                  ),
                                  child: const Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))),
              );

            default:
              return Scaffold(
                body: Center(
                  child: Text('Unimplemented $state'),
                ),
              );
          }
        },
        listener: (context, state) {});
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.textTime,
    required this.bubbleContent,
    required this.isSender,
  });

  final DateTime textTime;
  final String bubbleContent;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 20.w,
      ),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300.w),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align time text right
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSender
                        ? CustomColors.textFieldBackground
                        : CustomColors.chatBubbleColor,
                    borderRadius: isSender
                        ? BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r),
                          )
                        : BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          ),
                  ),
                  child: Text(
                    bubbleContent,
                    style: GoogleFonts.lexend(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: CustomColors.textGray,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    DateFormat('h:mm a').format(textTime),
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lexend(
                      textStyle: TextStyle(
                        color: CustomColors.textGray,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTopSection extends StatelessWidget {
  const ChatTopSection({
    super.key,
    required this.imageUrl,
    required this.menuOnPressed,
    required this.name,
  });

  final String imageUrl;
  final VoidCallback menuOnPressed;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTopBar(
          excludeBackButton: true,
          excludeLangDropDown: true,
          altIcon: IconButton(
            onPressed: menuOnPressed,
            icon: const Icon(
              Icons.more_vert,
              color: CustomColors.primary,
            ),
          ),
        ),
        SizedBox(height: 26.h),
        Container(
          width: 70.w,
          height: 70.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: CustomColors.background,
          ),
          child: ClipOval(
            child: Center(
              child: Image.asset(
                imageUrl,
                width: 60.w,
                height: 60.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(height: 35.h),
        Text(
          name,
          style: GoogleFonts.lexend(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
            ),
          ),
        ),
        SizedBox(height: 35.h),
      ],
    );
  }
}

class ChatNoticeCard extends StatelessWidget {
  const ChatNoticeCard({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318.w,
      decoration: BoxDecoration(
          color: CustomColors.textFieldBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 25.h),
          Text(
            'Notice',
            style: GoogleFonts.lexend(
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 36.h),
          const ListTileInfo(
            icon: Icons.warning,
            text:
                'Warning : to avoid any act of scam we ask you sincerely to not send money or respond to aid requests.',
          ),
          const Divider(color: Colors.white),
          const ListTileInfo(
            icon: Icons.description,
            text:
                'To report an offensive message, tap and hold the message and select the Report the message option',
          ),
          const Divider(color: Colors.white),
          const ListTileInfo(
            icon: Icons.verified_user,
            text:
                'You can manage your privacy and chat permissions through your account settings',
          ),
          const Divider(color: Colors.white),
          SizedBox(height: 10.h),
          CustomButton(
            onPressed: onPressed,
            text: 'Accept',
            shadowColor: CustomColors.shadowBlue,
            elevation: 5,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

class ListTileInfo extends StatelessWidget {
  const ListTileInfo({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: CustomColors.iconsGray,
      ),
      title: Text(
        text,
        style: GoogleFonts.lexend(
            textStyle: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w300,
        )),
      ),
    );
  }
}
