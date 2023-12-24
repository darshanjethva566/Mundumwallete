import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mundumwallet/core/utils/helper.dart';
import 'package:mundumwallet/global/common_page.dart';
import 'package:mundumwallet/modules/home/Wallet_screen.dart';
import 'package:mundumwallet/modules/home/browser_screens.dart';
import 'package:mundumwallet/modules/home/discover_screens.dart';
import 'package:mundumwallet/modules/home/history_screens.dart';
import 'package:mundumwallet/modules/home/setting_screens.dart';

import '../../controller/common.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final get = Get.put(Common());

  final List<Widget> _widgetOptions = <Widget>[
    const Browser(),
    const Discover(),
    const Wallet(),
    const History(),
    const Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            actions: [
              SvgPicture.asset("assets/profile.svg"),
              u_static.sPacerWidth(20.0.h)
            ],
            leadingWidth: 80.w,
            leading: Row(
              children: [
                TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero)),
                  onPressed: () {
                    showMaterialModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 0.9.sh,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 30.h, horizontal: 16.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    u_static.textWithPro(
                                        "Scan QR",
                                        28.0,
                                        FontWeight.w700,
                                        u_static.black_font,
                                        1),
                                    TextButton(
                                      child: u_static.textWithPro("Done", 14.0,
                                          FontWeight.w400, u_static.grey, 1),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                                Expanded(
                                    child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          'Hold yuor camera at QR code \nto scan the address',
                                          style: TextStyle(
                                            color: u_static.grey,
                                            fontSize: 12,
                                          ),
                                          maxLines: 2,
                                          textAlign: TextAlign.center),
                                      u_static.sPacerheight(50.h),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: 230.w,
                                            height: 230.w,
                                            child: Stack(
                                              children: [
                                                Positioned.fill(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: SvgPicture.asset(
                                                      'assets/qr_border.svg',
                                                      width: 55.w,
                                                      height: 55.w,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Positioned.fill(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Transform.flip(
                                                      flipX: true,
                                                      child: SvgPicture.asset(
                                                        'assets/qr_border.svg',
                                                        width: 55.w,
                                                        height: 55.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned.fill(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Transform.flip(
                                                      flipY: true,
                                                      child: SvgPicture.asset(
                                                        'assets/qr_border.svg',
                                                        width: 55.w,
                                                        height: 55.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned.fill(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Transform.flip(
                                                      flipX: true,
                                                      flipY: true,
                                                      child: SvgPicture.asset(
                                                        'assets/qr_border.svg',
                                                        width: 55.w,
                                                        height: 55.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned.fill(
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: SvgPicture.asset(
                                                      "assets/qr..svg",
                                                      width: 194.w,
                                                      height: 194.w,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/scanner.svg",
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.transparent),
        body: Obx(() => _widgetOptions.elementAt(get.activeIndex.value)),
        bottomNavigationBar: SizedBox(
          width: 1.sw,
          height: 100,
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 54.w,
                    height: 54.w,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF327115),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 1.sw,
                    height: 92.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [Color(0xFF327214), Color(0xFF111111)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x3F000000),
                          blurRadius: 4.r,
                          offset: Offset(0, 4.h),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Obx(
                      () => Padding(
                        padding: EdgeInsets.only(
                            left: 30.w, right: 30.w, bottom: 34.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            bottomNavBarItem(
                              onTap: () {
                                get.activeIndex.value = 0;
                              },
                              index: 0,
                              activeIcon: "browser_active.svg",
                              inactiveIcon: "browser_inactive.svg",
                              itemText: "Browser",
                            ),
                            bottomNavBarItem(
                              onTap: () {
                                get.activeIndex.value = 1;
                              },
                              index: 1,
                              activeIcon: "discover_active.svg",
                              inactiveIcon: "discover_inactive.svg",
                              itemText: "Discover",
                            ),
                            SizedBox(
                              width: 50.w,
                              height: 50.w,
                            ),
                            bottomNavBarItem(
                              onTap: () {
                                get.activeIndex.value = 3;
                              },
                              index: 3,
                              activeIcon: "history_active.svg",
                              inactiveIcon: "history_inactive.svg",
                              itemText: "History",
                            ),
                            bottomNavBarItem(
                              onTap: () {
                                get.activeIndex.value = 4;
                              },
                              index: 4,
                              activeIcon: "settings_active.svg",
                              inactiveIcon: "settings_inactive.svg",
                              itemText: "Settings",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            get.activeIndex.value = 2;
                          },
                          child: Container(
                            width: 54.w,
                            height: 54.w,
                            decoration: const ShapeDecoration(
                              color: Colors.transparent,
                              shape: OvalBorder(),
                            ),
                            child: Center(
                              child: AnimatedSwitcher(
                                duration: 500.ms,
                                transitionBuilder: (child, animation) {
                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  );
                                },
                                child: get.activeIndex.value == 2
                                    ? SvgPicture.asset(
                                        "assets/mundum_logo_gr.svg",
                                        width: 40.w,
                                        height: 40.w,
                                        fit: BoxFit.cover,
                                        key: const Key("1"),
                                      )
                                    : SvgPicture.asset(
                                        "assets/mundum_logo.svg",
                                        width: 40.w,
                                        height: 40.w,
                                        fit: BoxFit.cover,
                                        key: const Key("2"),
                                      ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Wallet",
                          textAlign: TextAlign.center,
                          style: googleDmSansTextStyle(
                            color: get.activeIndex.value == 2
                                ? Colors.white
                                : const Color(0xFFADADAD),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 0.12.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavBarItem({
    required String activeIcon,
    required String inactiveIcon,
    bool isMain = false,
    required int index,
    required String itemText,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => AnimatedSwitcher(
                duration: 500.ms,
                transitionBuilder: (child, animation) {
                  debugPrint('ANimation??');

                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: get.activeIndex.value == index
                    ? SvgPicture.asset(
                        "assets/$activeIcon",
                        width: isMain ? 40.w : 20.w,
                        height: isMain ? 40.w : 20.w,
                        fit: BoxFit.cover,
                        key: const Key("4"),
                      )
                    : SvgPicture.asset(
                        "assets/$inactiveIcon",
                        width: isMain ? 40.w : 20.w,
                        height: isMain ? 40.w : 20.w,
                        fit: BoxFit.cover,
                        key: const Key("3"),
                      ),
              )),
          SizedBox(
            height: 15.h,
          ),
          Text(
            itemText,
            textAlign: TextAlign.center,
            style: googleDmSansTextStyle(
              color: index == get.activeIndex.value
                  ? Colors.white
                  : const Color(0xFFADADAD),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: 0.12.h,
            ),
          ),
        ],
      ),
    );
  }
}
