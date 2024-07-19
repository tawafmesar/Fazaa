import 'dart:io';

import 'package:fazaa/core/class/statusrequest.dart';
import 'package:fazaa/core/functions/uploadfile.dart';
import 'package:fazaa/core/services/services.dart';
import 'package:fazaa/data/models/coursefile_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../core/constant/routes.dart';
import '../core/functions/handingdatacontroller.dart';
import '../data/datasource/remote/coursefile_data.dart';




abstract class ViewAllFilesController extends GetxController {

  getdata();
}



class ViewAllFilesControllerImp extends ViewAllFilesController {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController college_id;
  late TextEditingController courses_id;


  List<String> collegedata = [];
  List<String> coursedata = [];


  MyServices myServices = Get.find();


  late StatusRequest statusRequest = StatusRequest.none;

  CourseFileData courseFileData = CourseFileData(Get.find());


  List allfilesdata = [];



  @override
  void onInit() {
    college_id = TextEditingController();
    courses_id = TextEditingController();
    getdata();
    super.onInit();
  }


  void dispose() {
    college_id.dispose();
    courses_id.dispose();

    college_id = TextEditingController();
    courses_id = TextEditingController();

    super.dispose();
  }








  getdata() async {
    allfilesdata.clear();

    statusRequest = StatusRequest.loading;
    var response = await courseFileData.getcoursefile();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        List responsedata = response['data'];


        allfilesdata.addAll(responsedata.map((e) => coursefile_model.fromJson(e)));

        print("allfilesdata ...........................");

        for (var courseFile in allfilesdata) {

          print('File ID: ${courseFile.fileId}');
          print('File Name: ${courseFile.fileNameEn}');
          print('File Path: ${courseFile.filePath}');
          print('File Active: ${courseFile.fileActive}');
          print('College Name: ${courseFile.collegeNameEn}');
          print('Course Name: ${courseFile.coursesNameEn}');
          print('User Name: ${courseFile.usersName}');
          print('File Upload: ${courseFile.fileUpload}');
          print(" ...........................");

        }


        // print("allfilesdata");
        // print(allfilesdata);
        //
        // print("allfilesdatatestdata");
        // print(testdata);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  List getCourseFileData() {
    return allfilesdata;
  }


  goToAddFile(){
    Get.toNamed(AppRoute.addFile);

  }





}