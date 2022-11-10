import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Screen/Organic/organic_price.dart';
import 'package:green/Screen/metel/matel,price.dart';

import 'package:green/Feature/common/custom-button.dart';
import 'package:green/Feature/helper/common_var.dart';
import 'package:green/Feature/common/Price_managing.dart';

class Organic extends StatefulWidget {
  const Organic({super.key});

  @override
  State<Organic> createState() => _OrganicState();
}

int ovalue = 1;
int oprice = 35;
int ototal = 0;
Appcolor appcolor = Appcolor();

class _OrganicState extends State<Organic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            child: Icon(Icons.arrow_back_ios_new_outlined,
                color: appcolor.themegreen),
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(left: 80.w),
          child: Text(
            "\t\tOrganic",
            style: TextStyle(color: appcolor.themegreen, fontSize: 25.sp),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: appcolor.themecolor,
      body: Stack(
        children: [
          Positioned(
              bottom: 100,
              left: 30.w,
              child: Container(
                width: 300.w,
                height: 400.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: appcolor.themewhite),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Select The Weight of \n\t\t\t\t\t\t\t\t\t\tYour Waste",
                      style: TextStyle(color: Colors.green, fontSize: 25.sp),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 30.w, top: 20.h),
                          child: Text(
                            "Metal",
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.green),
                          ),
                        ),
                        SizedBox(
                          width: 120.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.h),
                          child: Text(
                            "Income",
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.green),
                          ),
                        )
                      ],
                    ),
                    custom_row(valu: ovalue, tota: ototal),
                    fixheightui,
                    Container(
                        width: 280.w,
                        child: Slider(
                            divisions: 12,
                            min: 1,
                            max: 12,
                            value: ovalue.toDouble(),
                            activeColor: Colors.green,
                            onChanged: (Value) {
                              ovalue = Value.toInt();
                              setState(() {
                                ototal = ovalue * oprice;
                              });
                            })),
                    fixheightui,
                    custom_button(
                        buttonname: "confirm",
                        color: Colors.green,
                        onPressed: () {
                          Get.to(Organic_waste());
                        })
                  ],
                ),
              ))
        ],
      ),
    );
  }
}