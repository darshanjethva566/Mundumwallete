import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mundumwallet/core/utils/helper.dart';
import 'package:mundumwallet/global/common_page.dart';

import '../../routes/pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(Routes.settings);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
        height: h,
        width: w,
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
                height: 229.h,
              ),
              Center(
                child: Container(
                  height: 82.w,
                  width: 82.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/mundum_logo.png"),
                          fit: BoxFit.fill)),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: Container(
                  height: 158.h,
                  width: 1.sw,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/mundum_txt.png"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(
                height: 226.h,
              ),
              Text(
                'Loading ...',
                textAlign: TextAlign.center,
                style: googleDmSansTextStyle(
                  color: const Color(0xFF9493AC),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: -0.32,
                ),
              ),
            ],
          ),
        ));
  }
}
