import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../core/utils/helper.dart';


class SettingsDetails {
  final String image;
  final String name;

  const SettingsDetails({required this.image, required this.name});
}


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  List<SettingsDetails> settings = [
    const SettingsDetails(image: 'image1', name: "Price Alerts"),
    const SettingsDetails(image: 'image2', name: "Contacts"),
    const SettingsDetails(image: 'image3', name: "Scan QR Code"),
    const SettingsDetails(image: 'image4', name: "WalletConnect"),
    const SettingsDetails(image: 'image5', name: "Notifications"),
    const SettingsDetails(image: 'image6', name: "Preferences"),
    const SettingsDetails(image: 'image7', name: "Help Center"),
    const SettingsDetails(image: 'image8', name: "Support"),
    const SettingsDetails(image: 'image9', name: "About"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:   Container(
        width: 1.sw,
        height: 1.sh,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Text(
              'Settings',
              style: googleDmSansTextStyle(
                color: Colors.black,
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                SettingsDetails data = settings.elementAt(index);
                return Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              data.name,
                              style: googleDmSansTextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            SvgPicture.asset(
                              "assets/right_arrow.svg",
                              width: 20.w,
                              height: 20.w,
                              fit: BoxFit.cover,
                              colorFilter: const ColorFilter.mode(
                                  Colors.grey, BlendMode.srcIn),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 5.h, left: 58.w),
                  width: 1.sw,
                  color: Colors.grey,
                  height: 1.h,
                );
              },
              itemCount: settings.length,
            ),
          ],
        ),
      ),);

  }
}
