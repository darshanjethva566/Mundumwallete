import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mundumwallet/controller/common.dart';

import 'package:mundumwallet/global/common_page.dart';
class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final get = Get.put(Common());
  @override
  void initState() {
    get.tabindex.value = 1;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:  Center(
          child: Padding(
            padding:  EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    u_static.textWithPro("\$",28.0, FontWeight.bold,Color(0xFFFFCC72),1),
                    u_static.textWithPro(" 44,346.95",28.0, FontWeight.bold,u_static.black_font,1),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    u_static.textWithPro("Main Count ",14.0, FontWeight.w400,u_static.grey,1),
                    Icon(Icons.remove_red_eye,color:u_static.grey ,size: 16,)
                  ],
                ),
                u_static.sPacerheight(30.h),
                tabs(),
                u_static.sPacerheight(30.h),
                Obx(() => CustomSlidingSegmentedControl<int>(
                  fixedWidth: 0.45.sw,

                  initialValue: 1,
                  children: {
                    1: u_static.textWithPro("Coins", 14, FontWeight.w500, get.tabindex.value==1?Colors.black:u_static.grey,1),
                    2: u_static.textWithPro("NFTs", 14, FontWeight.w500,  get.tabindex.value==2?Colors.black:u_static.grey,1),
                  },
                  decoration: BoxDecoration(
                    color: CupertinoColors.lightBackgroundGray,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  thumbDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      ),
                    ],
                  ),
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInToLinear,
                  onValueChanged: (v) {
                    get.tabindex.value = v;
                  },
                ),),
               // SizedBox(height: 20.h,),

                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(top: 20),

                    child: Obx(() => ListView.builder(shrinkWrap: true,itemCount:get.tabindex.value==1? 6:5,itemBuilder: (context, index) {
                      return get.tabindex.value==1?u_static.coiNs():u_static.nftSView();
                    },)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/add tokens.svg"),
                    u_static.sPacerWidth(6.w),
                    u_static.textWithPro("Add Token", 15.0, FontWeight.w400, u_static.grey, 1),
                  ],
                )



              ],
            ),
          ),
        ));

  }



  Row tabs() {
    return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        bottomShit(null,"Send");
                      },
                      child: Container(
                        height: 50.w,width: 50.w,


                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient:u_static.comm_grad
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(10.w),
                          child: SvgPicture.asset("assets/send.svg"),
                        ),
                      ),
                    ),
                    u_static.sPacerheight(5.0),
                    u_static.textWithPro("Send",12.0, FontWeight.w400,u_static.black_font,1),


                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        bottomShit("1","Receive");
                      },
                      child: Container(
                        height: 50.w,width: 50.w,


                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient:u_static.comm_grad
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(10.w),
                          child: SvgPicture.asset("assets/recieve.svg"),
                        ),
                      ),
                    ),
                    u_static.sPacerheight(5.0),

                    u_static.textWithPro("Receive",12.0, FontWeight.w400,u_static.black_font,1),


                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        bottomShit(null,"Buy");

                      },
                      child: Container(
                        height: 50.h,width: 50.w,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFBAD3AE)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(14.w),
                          child: SvgPicture.asset("assets/buy.svg"),
                        ),
                      ),
                    ),
                    u_static.sPacerheight(5.0),

                    Row(
                      children: [
                        Icon(Icons.info_outline,size: 10,color: u_static.grey),
                        u_static.textWithPro(" Buy",12.0, FontWeight.w400,u_static.grey,1),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: u_static.grey.withOpacity(0.2)
                      ),
                      child:Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),

                        child: u_static.textWithPro("Coming Soon",7.0, FontWeight.w200,u_static.black_font.withOpacity(0.7),1),
                      ),
                    )


                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        bottomShit(null,"Swap");

                      },
                      child: Container(
                        height: 50.w,width: 50.w,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFBAD3AE)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(12.w),
                          child: SvgPicture.asset("assets/export.svg"),
                        ),
                      ),
                    ),
                    u_static.sPacerheight(5.0),

                    Row(
                      children: [
                        Icon(Icons.info_outline,size: 10,color: u_static.grey),
                        u_static.textWithPro(" Swap",12.0, FontWeight.w400,u_static.grey,1),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: u_static.grey.withOpacity(0.2)
                      ),
                      child:Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                        child: u_static.textWithPro("Coming Soon",7.0, FontWeight.w200,u_static.black_font.withOpacity(0.7),1),
                      ),
                    )


                  ],
                ),





              ],
            );
  }

  Future<dynamic> bottomShit(dynamic data,String title) {
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
                                      u_static.textWithPro(title, 28.0, FontWeight.w700, u_static.black_font,1),
                                      TextButton(child: u_static.textWithPro("Done", 14.0, FontWeight.w400, u_static.grey,1),
                                      onPressed: () {
                                        Get.back();
                                      },),
                                    ],
                                  ),

                                  Padding(
                                    padding:  EdgeInsets.only(top: 12.h),
                                    child: TextFormField(

                                      textCapitalization: TextCapitalization.words,

                                      keyboardType: TextInputType.streetAddress,
                                      textInputAction: TextInputAction.done,
                                      // initialValue: get.house.value,
                                      autovalidateMode: AutovalidateMode.onUserInteraction,

                                      onChanged: (value) {

                                      },
                                      decoration: InputDecoration(

                                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                                        //  border: InputBorder.none,
                                        prefixIcon:
                                        Icon(Icons.search_rounded, color: u_static.grey),

                                        hintText: "Search",
                                        // labelStyle:
                                        // TextStyle(color: Colors.black.withOpacity(0.5)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(width: 1, color:u_static.grey ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(width: 1, color: u_static.grey),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              width: 1, color: u_static.grey), //<-- SEE HERE
                                        ),
                                      ),
                                    ),
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
                                        return u_static.stacking();
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
