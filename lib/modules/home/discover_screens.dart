import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:mundumwallet/global/common_page.dart';




class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(16.w),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                u_static.textWithPro("Trending MUNDUM News", 16.0, FontWeight.w500, u_static.black_font,1),
                InkWell(
                    onTap: () {
                      bottomShit(1);
                    },
                    child: u_static.textWithPro("See All", 14.0, FontWeight.w400, u_static.comm_green_collor,1)),
              ],
            ),
            u_static.sPacerheight( 5.h,),

            u_static.liNe(u_static.comm_green_collor),

            Padding(
              padding:  EdgeInsets.only(top: 20.h,bottom: 20.h),


              child: ListView.builder(                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,itemCount:3,itemBuilder: (context, index) {
                return u_static.newS();
              },),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                u_static.textWithPro("Staking", 16.0, FontWeight.w500, u_static.black_font,1),
                InkWell(onTap: () {
                  bottomShit(2);

                },child: u_static.textWithPro("See All", 14.0, FontWeight.w400, u_static.comm_green_collor,1)),
              ],
            ),
            u_static.sPacerheight( 5.h,),

            u_static.liNe(u_static.comm_green_collor,),
            Padding(
              padding:  EdgeInsets.only(top: 20.h,bottom: 20.h),

              child: ListView.builder( physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,itemCount:3,itemBuilder: (context, index) {
                return u_static.stacking();
              },),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                u_static.textWithPro("NFTs", 16.0, FontWeight.w500, u_static.black_font,1),
                InkWell(onTap: () {
                  bottomShit(3);

                },child: u_static.textWithPro("See All", 14.0, FontWeight.w400, u_static.comm_green_collor,1)),
              ],
            ),
            u_static.sPacerheight( 5.h,),

            u_static.liNe(u_static.comm_green_collor),
            Padding(
              padding:  EdgeInsets.only(top: 20.h,bottom: 20.h),

              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,itemCount:3,itemBuilder: (context, index) {
                return  u_static.nftSView();
              },),
            ),


          ],
        ),
      ),
    );

  }

  Future<dynamic> bottomShit(dynamic data) {
    return showMaterialModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 0.9.sh,
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 30.h,horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    u_static.textWithPro(data==1?"News":data==2?"Staking":"NFTs", 28.0, FontWeight.w700, u_static.black_font,1),
                    TextButton(child: u_static.textWithPro("Done", 14.0, FontWeight.w400, u_static.grey,1),
                      onPressed: () {
                        Get.back();
                      },),
                  ],
                ),

                Expanded(
                    child:data==null?Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/Star 4 1.png"),
                          u_static.sPacerheight(10.h),
                          u_static.textWithPro("No assets found, Receive the funds please", 12.0, FontWeight.w400,u_static.grey,1)
                        ],
                      ),
                    ):
                    ListView.builder(itemCount: 10,shrinkWrap: true,itemBuilder: (context, index) {
                      return data==1?u_static.newS():data==2?u_static.stacking():u_static.nftSView();
                    },)
                )
              ],
            ),
          ),
        );
      },
    );
  }

}
