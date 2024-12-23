import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qismati/common/colors.dart';

class NotificationPopup extends StatefulWidget {
  const NotificationPopup({
    super.key,
  });
  @override
  createState() => _NotificationPopupState();

  static void showNotification(
    BuildContext context, {
    required String imagePath,
    required String userName,
    required String message,
  }) {
    debugPrint("NotificationPopupState: Reached StatefulWidget call");
    final _NotificationPopupState? state =
        context.findAncestorStateOfType<_NotificationPopupState>();
    debugPrint('NotificationPopupState: state is $state');
    state?.showNotification(imagePath, userName, message);
  }

  static _NotificationPopupState? of(BuildContext context) {
    return context.findAncestorStateOfType<_NotificationPopupState>();
  }
}

class _NotificationPopupState extends State<NotificationPopup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  String imagePath = '';
  String userName = '';
  String message = '';
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  void showNotification(
    String ip,
    String uName,
    String msg,
  ) {
    debugPrint("NotificationPopupState: Reached State implementation call");
    setState(() {
      imagePath = ip;
      userName = uName;
      message = msg;
    });
    _controller.forward();
    Future.delayed(const Duration(seconds: 3), () {
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("NotificationPopUp: Reached to widget call");
    return SlideTransition(
      position: _offsetAnimation,
      child: Align(
        alignment: Alignment.topCenter,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.16,
          child: Material(
            color: Colors.transparent,
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  color: CustomColors.borderOutline,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: ClipOval(
                        child: Center(
                          child: Image.asset(
                            imagePath,
                            width: 30.w,
                            height: 30.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 30.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            userName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 200,
                            child: Text(
                              message,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
