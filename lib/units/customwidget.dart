import 'package:flutter/material.dart';
import 'package:get/get.dart';

appbutton({titel,void Function()? onTap}){
  return InkWell(onTap:onTap,
    child: Container(
      height: Get.height / 18,
      width: Get.width / 2.5,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(40)),
      child: Center(
        child: Text(titel,

          style: const TextStyle(
              color: Colors.white,fontSize:16, fontFamily: "popins"),
        ),
      ),
    ),
  );
}