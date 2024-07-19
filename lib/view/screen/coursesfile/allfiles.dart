import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/viewallfiles_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/services/assets_manager.dart';
import '../../../linkapi.dart';
import '../FileDownloadScreen.dart';

class AllFileScreen extends StatelessWidget {
  const AllFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final btncontroller = Get.put(ViewAllFilesControllerImp());
    Get.put(ViewAllFilesControllerImp());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.clockOutline,
          elevation: 2,
          leading: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(AppImageAsset.logo),
          ),
          title:
           Text("Files",
             style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
          ),
          actions: [
            IconButton(
              onPressed: () async {
              },
              icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
            ),
          ],
        ),
      body: GetBuilder<ViewAllFilesControllerImp>(builder: ((controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              ...List.generate(
                  controller.allfilesdata.length,
                      (index) => Container(
                    margin: const EdgeInsets.all(10), // Add margin as needed
                    child: Material(
                      elevation: 10,
                      shape:const RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColor.primaryColor, // Border color
                          width: 3.0, // Border width
                        ),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomRight: Radius.circular(25)), // Border radius
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Material(
                            borderRadius:const BorderRadius.only(
                                topLeft: Radius.circular(25)),
                            color: AppColor.primaryTextColor,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Image.asset(

                                    'assets/images/pdf.png',
                                    height: 30,
                                    width: 30,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child:
                                    Text("${controller.allfilesdata[index].fileNameEn}"
                                      ,style: TextStyle(
                                      color:  Colors.black54,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.grey[200], // Set a background color for better visualization
                            child: Row(
                              children: [

                                Expanded(
                                  child: Container(
                                    color: AppColor.primaryColor3,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 10),

                                              height: 40,
                                              child:Icon(
                                                FontAwesomeIcons.bookOpen,
                                                color: AppColor.scaffoldBackgroundColor,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.only(left: 10),
                                                height: 30,
                                                child:  Text('Course name  ${controller.allfilesdata[index].coursesNameEn} ',style: TextStyle(color: AppColor.scaffoldBackgroundColor),),
                                              ),
                                            ),
                                            SizedBox(width: 10,),

                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 10),

                                              height: 40,
                                              child:Icon(
                                                FontAwesomeIcons.buildingColumns,
                                                color: AppColor.scaffoldBackgroundColor,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.only(left: 10),
                                                height: 30,
                                                child:  Text('Collge name  ${controller.allfilesdata[index].collegeNameEn}',style: TextStyle(color: AppColor.scaffoldBackgroundColor),),
                                              ),
                                            ),
                                            SizedBox(width: 10,),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.25, // Calculate 25% width
                                  color: Colors.blue[100], // Set a background color for the first column
                                  child: Center(
                                    child: ElevatedButton(
                                        style:ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(AppColor.primaryColor2), // Set the background color here

                                        ),
                                      onPressed: () async {
                                        try {

                                          onFileTileTap(
                                            context: context,
                                            index: index,
                                            url: "${AppLink.upload}${controller.allfilesdata[index].filePath}",
                                            title: '${controller.allfilesdata[index].fileNameEn} ',
                                          );
                                        } catch (e) {
                                          print('Error downloading file: $e');
                                          // Handle the error here
                                        }
                                      }, // Add function for button press
                                      child: Text('Download'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration:const BoxDecoration(
                                color: AppColor.primaryColor2,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(25))
                            ),
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 30,
                                      child:const Center(
                                        child: Icon(
                                          FontAwesomeIcons.user,
                                          color: AppColor.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      child:  Center(
                                        child: Text('   ${controller.allfilesdata[index].usersName}',style: TextStyle(color: AppColor.white),),
                                      ),
                                    ),
                                    SizedBox(width: 10,),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      height: 30,
                                      child:const Center(
                                        child: Icon(
                                          FontAwesomeIcons.calendar,
                                          color: AppColor.white,
                                        ),
                                      ),
                                    )
                                    ,  Container(
                                      height: 32,
                                      child:  Center(
                                        child: Text('${controller.allfilesdata[index].fileUpload}',style: TextStyle(color: AppColor.white),),
                                      ),
                                    ),
                                    SizedBox(width: 10,),

                                  ],
                                )
                                ,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              )
            ],
          ))),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor2,
        onPressed: () {
          btncontroller.goToAddFile();
        },
        child: Icon(Icons.add,color: AppColor.white,),

      ),
    );

  }
}

Future<void> onFileTileTap({
  required String url,
  required String title,

  required int index,
  required BuildContext context,
}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return FileDownloadScreen(
          url: url,
          index: index,
          context: context,
          title: title,
        );
      },
    ),
  );
}

