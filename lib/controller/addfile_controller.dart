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




abstract class AddFileController extends GetxController {
  addFile();

}



class AddFileControllerImp extends AddFileController {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController filename;
  late TextEditingController college_id;
  late TextEditingController courses_id;
  String? users_id;
  File? file;



  List<String> collegedata = [];
  List<String> coursedata = [];


  MyServices myServices = Get.find();


  late StatusRequest statusRequest = StatusRequest.none;

  CourseFileData courseFileData = CourseFileData(Get.find());


  List data = [];



  @override
  void onInit() {
    filename = TextEditingController();
    college_id = TextEditingController();
    courses_id = TextEditingController();
    users_id = myServices.sharedPreferences.getString("id");
    getDataCollege();
    super.onInit();
  }


  void dispose() {
    filename.dispose();
    college_id.dispose();
    courses_id.dispose();


    filename = TextEditingController();
    college_id = TextEditingController();
    courses_id = TextEditingController();

    super.dispose();
  }


  chooseFile() async{


    if (await Permission.storage.request().isGranted){
      file = await fileUploadGallery();
      update();
    }

  }



  @override
  addFile() async {

    if (file == null) {
      Get.defaultDialog(
        title: "Warning",
        middleText: "Please try again and make sure to upload a file",
      );
      return;
    }

    Map data = {
      "file_name_en": filename.text,
      "college_id": college_id.text,
      "courses_id": courses_id.text,
      "user_id": users_id,
    };

    print("data =======================   $data ");
    print("file =======================   $file ");

    statusRequest = StatusRequest.loading;

    try {
      var response = await courseFileData.addFile(data, file!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        print("Response from server: $response");

          if (response['status'] == "success") {
            Get.offNamed(AppRoute.homepage);

          } else {
            Get.defaultDialog(
              title: "تنبيــة",
              middleText: "يرجى التأكد , البريد الألكتروني او رقم الهاتف موجود مسبقاً",
            );
            statusRequest = StatusRequest.failure;
          }

      }
    } catch (e) {
      print("Exception during addFile: $e");
      statusRequest = StatusRequest.serverException;
    } finally {
      update();
    }

  }


  Map<String, String> collegeMap = {}; // Map to store college_name_en to college_id
  getDataCollege() async {
    collegedata.clear();
    collegeMap.clear(); // Clear the map before populating it again
    statusRequest = StatusRequest.loading;

    var response = await courseFileData.getCollege();

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responsedata = response['data'];
        for (var item in responsedata) {
          String college_id = item['college_id'];
          String college_name = item['college_name_en'];
          collegedata.add(college_name);
          collegeMap[college_name] = college_id; // Map college_name_en to college_id
        }
        print("collegedata......................................");
        print(collegedata);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  Map<String, String> CourseMap = {}; // Map to store college_name_en to college_id
  getDataCourse() async {
    coursedata.clear();
    CourseMap.clear(); // Clear the map before populating it again

    statusRequest = StatusRequest.loading;


    var response = await courseFileData.getCourse(college_id.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> responsedata = response['data'];
        for (var item in responsedata) {
          String course_id = item['courses_id'];
          String course_name = item['courses_name_en'];
          coursedata.add(course_name);
          CourseMap[course_name] = course_id; // Map college_name_en to college_id
        }

        print("coursedata......................................");
        print(coursedata);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }







}