import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mundumwallet/core/utils/helper.dart';
import 'package:mundumwallet/global/common_page.dart';
import 'package:mundumwallet/routes/pages.dart';


class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List scrollTitle = [
    "Multicurrency",
    "Send",
    "Security",
    "MUNDUM",
  ];

  List scrollDesc = [
    "Get access to your favorite  ERC 20 cryptocurrencies",
    "Fast and secure sending of cryptocurrencies",
    "Conduct secure receive with cryptocurrencies",
    "Enjoy your wallet",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 1.w,
      width: 1.sh,
      decoration: BoxDecoration(
        gradient: u_static.comm_grad,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 217.h,
            ),

            //CONTAINER
            Expanded(
              child: SizedBox(
                width: 1.sw,
                child: CarouselSlider(
                  items: List.generate(4, (index) {
                    return InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Container(
                              height: 110.w,
                              width: 110.w,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage("assets/multi_scroll.png"),
                                fit: BoxFit.cover,
                              )),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Text(
                              scrollTitle[index],
                              style: googleDmSansTextStyle(
                                color: const Color(0xFFC7AE8D),
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                                height: 0.06,
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Expanded(
                                child: Text(
                              scrollDesc[index],
                              style: googleDmSansTextStyle(
                                color: const Color(0xFFADADAD),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: -0.32,
                              ),
                              textAlign: TextAlign.center,
                            )),
                          ],
                        ));
                  }),
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      reverse: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),

            //SCROLL EFFECT
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: scrollTitle.asMap().entries.map((entry) {
                return InkWell(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: AnimatedContainer(
                    width: _current == entry.key ? 20.w : 7.w,
                    height: _current == entry.key ? 20.w : 7.w,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/scroll_star.png")),
                      borderRadius:
                          // _current == entry.key
                          //     ? BorderRadius.circular(20):
                          BorderRadius.circular(100.r),
                      color: _current == entry.key
                          ? Colors.transparent
                          : Colors.white,
                    ),
                    duration: const Duration(milliseconds: 400),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 169.h,
            ),

            //CREATE NEW WALLET
            InkWell(
              onTap: () {
                Get.toNamed(Routes.createPassScreen);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  'Create a new wallet',
                  textAlign: TextAlign.center,
                  style: googleDmSansTextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),

            //ALREADY HAVE WALLET
            Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  'I already have a wallet',
                  textAlign: TextAlign.center,
                  style: googleDmSansTextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
