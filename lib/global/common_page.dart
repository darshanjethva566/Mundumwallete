import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mundumwallet/core/utils/helper.dart';

class u_static{
  static Color comm_green_collor=Color(0xff225A27);
  static Color comm_scroll_title=Color(0xffC8AE8D);
  static Color grey=Color(0xffADADAD);
  static Color black_font=Colors.black;
  static TextStyle scroll_title_style=TextStyle(
    color: comm_scroll_title,fontSize: 24,fontFamily: "DM Sans"
  );
  static TextStyle scroll_desc_style=TextStyle(
      color: Color(0xffADADAD),fontSize: 16,fontFamily: "DM Sans"
  );
 static Widget sPacerheight(size) {
    return SizedBox(
      height: size,
    );
  }
  static Widget sPacerWidth(size) {
    return SizedBox(
      width: size,
    );
  }
  static appBar() {
    return AppBar(
      actions: [
        Icon(Icons.person_2)
      ],
        leading: GestureDetector(
            onTap: () {

            },
            child:SvgPicture.asset(
                height: 10.h,
                "assets/scanner.svg")),
        backgroundColor: Colors.transparent);
  }
  static RadialGradient comm_grad=RadialGradient(
    colors: [u_static.comm_green_collor, Colors.black],
    center: Alignment(0, -0.3.h),
    radius: 1,
  );
 static Widget textWithPro(String text,double font,FontWeight weight,Color color,int line) {
   return Text(maxLines: line,text,
   overflow: TextOverflow.ellipsis,
       style: googleDmSansTextStyle(
           fontSize: font.sp,fontWeight: weight,
           color: color,));
 }
 static   Widget liNe(Color color) => Container(height: 1,width: 1.sw,color: color);
  static Widget coiNs() {
    return Padding(
      padding:  EdgeInsets.only(top: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/image 1.png'),
                  ),
                  u_static.sPacerWidth(10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 70.w,child: u_static.textWithPro("Bitcoin", 16.0, FontWeight.w500, u_static.black_font,1)),
                      SizedBox(width: 70.w,child: u_static.sPacerheight(2.h)),

                      SizedBox(width: 80.w,child: u_static.textWithPro("\$456089,89", 14.0, FontWeight.w400, u_static.grey,1)),

                    ],
                  )

                ],
              ),
              u_static.textWithPro("+2.06%", 14.0, FontWeight.w400, Colors.green,1),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 50.w,child: Align(alignment: Alignment.centerRight,child: u_static.textWithPro("0 BTC", 16.0, FontWeight.w500, u_static.black_font,1))),
                  SizedBox(width: 50.w,child: u_static.sPacerheight(2.h)),

                  SizedBox(width: 50.w,child: Align(alignment: Alignment.centerRight,child: u_static.textWithPro("\$0", 14.0, FontWeight.w400, u_static.grey,1))),

                ],
              )

            ],),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 10.h),
            child: u_static.liNe(u_static.grey.withOpacity(0.4)),
          ),

        ],
      ),
    );
  }

  static   Widget nftSView() {
  return Column(
    children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 75.w,
                  width: 75.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage("assets/supergirl.png"))
                  ),
                ),
                u_static.sPacerWidth(10.w),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 100.w,child: u_static.textWithPro("Super Girl", 16.0, FontWeight.w500, Colors.black,1)),
                    u_static.sPacerheight(4.h),
                    SizedBox(width: 70.w,child: u_static.textWithPro("1.20 ETV", 14.0, FontWeight.w400, u_static.comm_green_collor,1)),
                  ],
                )
              ],
            ),
            Row(
              children: [
                u_static.textWithPro("67", 14.0, FontWeight.w400, Colors.black,1),
                u_static.sPacerWidth( 5.w,),

                Icon(Icons.favorite,color: Colors.red,size: 20,)
              ],
            )
          ]),
      Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h),
        child: u_static.liNe(u_static.grey.withOpacity(0.4)),
      ),
    ],
  );
}
 static Widget newS() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 75.w,
              width: 75.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage("assets/supergirl.png"))
              ),
            ),
            u_static.sPacerWidth(10.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  u_static.textWithPro("Bank of Russia to Test Digital Rubles; XRP's Success in P...", 16.0, FontWeight.w500, Colors.black,2),
                  u_static.sPacerheight(10.h),
                  u_static.textWithPro("#Coins #Cripto #CoinsNews #CoinsGetFast", 14.0, FontWeight.w400, u_static.grey,1),
                ],
              ),
            )
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: u_static.liNe(u_static.grey.withOpacity(0.4)),
        ),


      ],
    );
  }
  static Widget stacking() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/image 1.png'),
                ),
                u_static.sPacerWidth(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    u_static.textWithPro("Stride (STRD)", 16.0, FontWeight.w500, u_static.black_font,1),
                    SizedBox(width: 70.w,child: u_static.sPacerheight(2.h)),

                    Row(
                      children: [
                        u_static.textWithPro("APR : ", 14.0, FontWeight.w400, u_static.grey,1),
                        u_static.textWithPro("+2.06%", 14.0, FontWeight.w400, Colors.green,1),

                      ],
                    ),

                  ],
                )

              ],
            ),



          ],),


        Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.h),
          child: u_static.liNe(u_static.grey.withOpacity(0.4)),
        ),


      ],
    );
  }



// static
}

