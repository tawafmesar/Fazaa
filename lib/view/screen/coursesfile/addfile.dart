import 'package:fazaa/controller/addfile_controller.dart';
import 'package:fazaa/core/class/handlingdataview.dart';
import 'package:fazaa/core/constant/color.dart';
import 'package:fazaa/core/functions/validinput.dart';
import 'package:fazaa/view/widget/auth/custombuttonauth.dart';
import 'package:fazaa/view/widget/auth/customtextformauth.dart';
import 'package:fazaa/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class AddFileScreen extends StatefulWidget {
  const AddFileScreen({super.key});

  @override
  State<AddFileScreen> createState() => _AddFileScreenState();
}

class _AddFileScreenState extends State<AddFileScreen> {

  String? selectedOption;
  String? selectedOption2;




  @override
  Widget build(BuildContext context) {
    Get.put(AddFileControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.clockOutline,
        elevation: 0.0,

        title: Text(
          'Add New Files',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: AppColor.scaffoldBackgroundColor,),
          onPressed: () => Navigator.pop(context), // Handle back button press
        ),
      ),
      body: GetBuilder<AddFileControllerImp>(

        builder: (controller) => HandlingDataViewRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  const CustomTextTitleAuth(text: "Medicine Details"),
                  const SizedBox(height: 15),
                  CustonTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 3, 20, "username");
                    },
                    mycontroller: controller.filename ,
                    hinttext: "Enter the files name",
                    iconData:
                      FontAwesomeIcons.filePdf,


                    labeltext: " Name",
                  ),
                  SizedBox(height: 20,),

                  DropdownButtonFormField<String>(
                    value: selectedOption, // Initially selected option (can be null).
                    decoration: InputDecoration(
                      hintText: 'Enter college name',
                      hintStyle: const TextStyle(fontSize: 14),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      label: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 9),
                        child: Text('College'),
                      ),
                      suffixIcon: InkWell(child: Icon(FontAwesomeIcons.bookOpen)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue; // Update selected option
                        if (newValue != null) {
                          controller.college_id.text = controller.collegeMap[newValue] ?? ''; // Assign the selected college_id to controller.college_id
                          controller.getDataCourse();

                        }
                      });
                    },
                    items: controller.collegedata.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),


                  SizedBox(height: 20,),

                  DropdownButtonFormField<String>(
                    value: selectedOption2, // Initially selected option (can be null).
                    decoration: InputDecoration(
                      hintText: 'Enter course name',
                      hintStyle: const TextStyle(fontSize: 14),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      label: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 9),
                        child: Text('Course'),
                      ),
                      suffixIcon: InkWell(child: Icon(FontAwesomeIcons.buildingColumns)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption2 = newValue; // Update selected option
                        if (newValue != null) {
                          controller.courses_id.text = controller.CourseMap[newValue] ?? ''; // Assign the selected college_id to controller.college_id

                        }
                      });
                    },
                    items: controller.coursedata.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),


                  SizedBox(height: 20,),

                  CustomButtomAuth(text: "chose File", onPressed: () {
                    print('Selected Option: $selectedOption');
                    controller.chooseFile();
                  }),

                  if(controller.file != null)
                    Center(child: Text('File Picked'))
                  ,
                  CustomButtomAuth(text: "Save", onPressed: () {
                    // print('Selected Option: $selectedOption');
                    controller.addFile();
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
