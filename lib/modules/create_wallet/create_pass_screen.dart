import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mundumwallet/core/utils/helper.dart';
import 'package:mundumwallet/global/common_page.dart';
import 'package:mundumwallet/global/hr_divider.dart';
import 'package:mundumwallet/global/star_widget.dart';
import 'package:mundumwallet/routes/pages.dart';

class CreatePassScreen extends StatefulWidget {
  const CreatePassScreen({super.key});

  @override
  State<CreatePassScreen> createState() => _CreatePassScreenState();
}

class _CreatePassScreenState extends State<CreatePassScreen> {
  bool termsAgreed = false;
  bool isFaceIdEnabled = false;
  bool isPasswordVisible = false;
  bool isConPasswordVisible = false;
  int currPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      decoration: BoxDecoration(gradient: u_static.comm_grad),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 70.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (currPage == 0) {
                          Get.back();
                        } else {
                          _pageController.previousPage(
                              duration: 400.ms, curve: Curves.easeIn);
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/left_arrow.svg',
                      ),
                    ),
                    SizedBox(
                      width: 28.w,
                    ),
                    const StarWidget(isActivated: true),
                    SizedBox(
                      width: 8.w,
                    ),
                    HRDivider(
                      isActive: currPage == 1 || currPage == 2 ? true : false,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    StarWidget(isActivated: currPage == 1 ? true : false),
                    SizedBox(
                      width: 8.w,
                    ),
                    HRDivider(
                      isActive: currPage == 2 ? true : false,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    StarWidget(isActivated: currPage == 2 ? true : false),
                  ],
                ),
              ),

              SizedBox(
                height: 87.h,
              ),

              SizedBox(
                height: 490.h,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currPage = value;
                    });
                  },
                  padEnds: false,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  children: [
                    CreateNewPassWidget(),
                    SecureYourWalletWidget(),
                  ],
                ),
              ),

              //Remind me later
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Visibility(
                  visible: currPage == 1,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (currPage == 1) {
                            Get.offNamed(Routes.homescreen);
                          } else {
                            _pageController.nextPage(
                                duration: 400.ms, curve: Curves.easeOut);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff9493AC)),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            "Remind Me Later",
                            style: googleDmSansTextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ).animate().fadeIn(),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                ),
              ),

              currPage == 0
                  ? SizedBox(
                      height: 48.h,
                    )
                  : Container(),

              //NEXT
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GestureDetector(
                  onTap: () {
                    if (currPage == 1) {
                      Get.offNamed(Routes.homescreen);
                    } else {
                      _pageController.nextPage(
                          duration: 400.ms, curve: Curves.easeOut);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff9493AC)),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      "Next",
                      style: googleDmSansTextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CreateNewPassWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //CREATE PASS TITLE
          Center(
            child: Text(
              'Create Password',
              textAlign: TextAlign.center,
              style: googleDmSansTextStyle(
                color: const Color.fromRGBO(239, 187, 94, 1),
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          SizedBox(
            height: 16.h,
          ),

          //THIS PASS TXT
          Center(
            child: Text(
              'This password will unlock your Rabbit wallet only on this service',
              textAlign: TextAlign.center,
              style: googleDmSansTextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 102.h,
          ),

          //NEW PASS
          TextFormField(
            style: googlePoppinsSansTextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            cursorColor: Colors.white,
            obscureText: isPasswordVisible,
            decoration: InputDecoration(
                hintStyle: googlePoppinsSansTextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                labelText: "New password",
                labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  child: !isPasswordVisible
                      ? SvgPicture.asset(
                          "assets/eyes_hide.svg",
                          width: 20.w,
                          height: 20.w,
                          fit: BoxFit.cover,
                        )
                      : SvgPicture.asset(
                          "assets/eyes_show.svg",
                          width: 20.w,
                          height: 20.w,
                          fit: BoxFit.cover,
                        ),
                ),
                contentPadding: EdgeInsets.only(left: 8.w, right: 8.w),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.7),
                      style: BorderStyle.solid),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.7),
                      style: BorderStyle.solid),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.7),
                        style: BorderStyle.solid))),
          ),
          SizedBox(
            height: 2.h,
          ),

          Text("Must be at least 8 characters",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xff999999).withOpacity(0.7),
                  fontFamily: "DM Sans",
                  fontSize: 12)),
          SizedBox(
            height: 20.h,
          ),

          //CONF PASS
          TextFormField(
            style: googlePoppinsSansTextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            cursorColor: Colors.white,
            obscureText: isConPasswordVisible,
            decoration: InputDecoration(
                hintStyle: googlePoppinsSansTextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                labelText: "Confirm password",
                labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      isConPasswordVisible = !isConPasswordVisible;
                    });
                  },
                  child: !isConPasswordVisible
                      ? SvgPicture.asset(
                          "assets/eyes_hide.svg",
                          width: 20.w,
                          height: 20.w,
                          fit: BoxFit.cover,
                        )
                      : SvgPicture.asset(
                          "assets/eyes_show.svg",
                          width: 20.w,
                          height: 20.w,
                          fit: BoxFit.cover,
                        ),
                ),
                contentPadding: EdgeInsets.only(left: 8.w, right: 8.w),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.7),
                      style: BorderStyle.solid),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.7),
                      style: BorderStyle.solid),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.7),
                        style: BorderStyle.solid))),
          ),
          SizedBox(
            height: 24.h,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Sign in with the Face ID ?',
                textAlign: TextAlign.center,
                style: googlePoppinsSansTextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Switch.adaptive(
                value: isFaceIdEnabled,
                thumbColor: const MaterialStatePropertyAll(Colors.white),
                activeTrackColor: const Color(0xFF54FD65),
                inactiveTrackColor: const Color(0xFF999999),
                trackOutlineColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                onChanged: (val) {
                  setState(() {
                    isFaceIdEnabled = val;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 34.h,
          ),

          SizedBox(
            width: 1.sw,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      termsAgreed = !termsAgreed;
                    });
                  },
                  child: AnimatedSwitcher(
                    duration: 500.ms,
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: !termsAgreed
                        ? Container(
                            width: 20.w,
                            height: 20.w,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(
                                color: Colors.grey,
                                width: 2.w,
                              ),
                            ),
                          )
                        : SvgPicture.asset(
                            width: 20.w,
                            height: 20.w,
                            fit: BoxFit.cover,
                            "assets/check-square.svg",
                          ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: Text(
                    "By proceeding, you agree to these Term and Conditions.",
                    style: googlePoppinsSansTextStyle(
                      color: const Color(0xFFB3B3B3),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget SecureYourWalletWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //CREATE PASS TITLE
          Center(
            child: Text(
              'Secure your wallet',
              textAlign: TextAlign.center,
              style: googleDmSansTextStyle(
                color: const Color.fromRGBO(239, 187, 94, 1),
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          SizedBox(
            height: 16.h,
          ),

          //THIS PASS TXT
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      'Don\'t risk losing your funds. protect your wallet by saving your ',
                  style: googleDmSansTextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Seed phrase',
                  style: googleDmSansTextStyle(
                    color: const Color(0xFFEFBB5E),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: ' in a place\nyou trust. ',
                  style: googleDmSansTextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(
            height: 14.h,
          ),
          Text(
            'It\'s the only way to recover your wallet if you get locked out of the app or get a new device.',
            textAlign: TextAlign.center,
            style: googleDmSansTextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
