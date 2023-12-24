

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
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



  List<Widget> _widgetOptions = <Widget>[
    Browser(),
    Discover(),
    Wallet(),
    History(),
    Setting(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

            actions: [
        SvgPicture.asset(
            "assets/profile.svg"),
              u_static.sPacerWidth(20.0.h)
            ],
            leadingWidth: 80.w,

            leading: Row(
              children: [

                TextButton(
                  style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
                  onPressed: () {
                    showMaterialModalBottomSheet(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                                    u_static.textWithPro("Scan QR", 28.0, FontWeight.w700, u_static.black_font,1),
                                    TextButton(child: u_static.textWithPro("Done", 14.0, FontWeight.w400, u_static.grey,1),
                                      onPressed: () {
                                        Get.back();
                                      },),
                                  ],
                                ),

                                Expanded(
                                    child:Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Hold yuor camera at QR code \nto scan the address',style: TextStyle(color: u_static.grey,fontSize: 12,),maxLines: 2,textAlign: TextAlign.center),
                                          u_static.sPacerheight(50.h),
                                          Column(
                                            children: [
                                              Row(
                                                children: [

                                                ],
                                              ),
                                              SvgPicture.asset("assets/qr..svg"),
                                            ],
                                          )

                                        ],
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: SvgPicture.asset(
                      "assets/scanner.svg",),
                ),
              ],
            ),
            backgroundColor: Colors.transparent),
        body: Obx(() => _widgetOptions.elementAt(get.activeIndex.value)),
        bottomNavigationBar:Obx(() => MoltenBottomNavigationBar(
          borderRaduis: BorderRadius.circular(0),

          duration: Duration(milliseconds: 500),
          borderColor: Colors.red,

          domeCircleColor: Colors.blue,//insider color
          selectedIndex: get.activeIndex.value,

          onTabChange: (clickedIndex) {

            get.activeIndex.value = clickedIndex;

          },
          tabs: [
            MoltenTab(
              icon: Icon(Icons.language),
              title: Text("Browser")
            ),
            MoltenTab(
              icon: Icon(Icons.video_collection),
            ),
            MoltenTab(
              icon: Icon(Icons.home),
            ),
            MoltenTab(
              icon: Icon(Icons.favorite_border),
            ),
            MoltenTab(
              icon: Icon(Icons.settings),
            ),
          ],
        )),
      ),
    );
  }
}
