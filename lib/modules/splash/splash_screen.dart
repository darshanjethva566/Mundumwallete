import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mundumwallet/global/common_page.dart';
import 'package:mundumwallet/routes/pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(Routes.onBoardScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Container(
      height:h,
        width: w,
        decoration: BoxDecoration(
          gradient: u_static.comm_grad
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: h*0.12,
                  width: w*0.25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/mundum_logo.png"),
                      fit: BoxFit.fill
                    )
                  ),
                ),
              ),
              SizedBox(height: 10,),

              Center(
                child: Container(
                  height: h*0.2,
                  width: w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/mundum_txt.png"),
                        fit: BoxFit.fill
                      )
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
