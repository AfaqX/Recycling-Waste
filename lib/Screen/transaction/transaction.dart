import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/common/custom_textfield.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/common_var.dart';

import 'package:green/Screen/transaction/bank_detail.dart';
import 'package:green/Screen/transaction/model.dart';

class transaction extends StatefulWidget {
  const transaction({super.key});

  @override
  State<transaction> createState() => _transactionState();
}

Appcolor appcolor = Appcolor();

class _transactionState extends State<transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: appcolor.themegreen,
            ),
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(left: 70.w),
          child: Text(
            "Send Money",
            style: TextStyle(color: appcolor.themegreen, fontSize: 20.sp),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: appcolor.themecolor,
      body: Container(
          width: double.infinity,
          child: Column(
            children: [
              fixheight,
              custom_textfield(
                hintext: "Search",
                maincolor: appcolor.themewhite,
                passicon: Icon(
                  Icons.search,
                  color: appcolor.themewhite,
                ),
                color: appcolor.themewhite,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: banklist.length,
                      itemBuilder: (context, index) {
                        var data = banklist[index];
                        return InkWell(
                          onTap: () {
                            Get.to(bank_detail(
                              name: " ${data.Sub_name}",
                              image: "${data.Image}",
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border:
                                      Border.all(color: appcolor.themegreen)),
                              child: Center(
                                child: ListTile(
                                  leading: Image.asset(
                                    "${data.Image}",
                                    scale: 7,
                                  ),
                                  title: Text(
                                    "${data.Sub_name}",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: appcolor.themewhite,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_outlined,
                                    color: appcolor.themewhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
            ],
          )),
    );
  }
}
