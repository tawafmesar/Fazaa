import 'package:fazaa/core/class/handlingdataview.dart';
import 'package:fazaa/data/models/coursefile_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:get/get.dart';

import '../../../controller/viewallfiles_controller.dart';


class ViewAllFiles extends StatelessWidget {

  const ViewAllFiles({super.key});



  @override
  Widget build(BuildContext context) {
    Get.put(ViewAllFilesControllerImp());

    var coursefile = getCourseFileData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: GetBuilder<ViewAllFilesControllerImp>
        (builder: (controller) => HandlingDataViewRequest(

          statusRequest:  controller.statusRequest,
          widget: SfDataGrid(
            source: CourseFileDataSource(courseFileData: controller.allfilesdata),
            columnWidthMode: ColumnWidthMode.fill,
            columns: <GridColumn>[

              GridColumn(
                columnName: 'fileNameEn',
                label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('File Name'),
                ),
              ),
              GridColumn(
                columnName: 'filePath',
                label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('File Path'),
                ),
              ),

              GridColumn(
                columnName: 'collegeNameEn',
                label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('College Name'),
                ),
              ),
              GridColumn(
                columnName: 'coursesNameEn',
                label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Courses Name'),
                ),
              ),
              GridColumn(
                columnName: 'usersName',
                label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('User Name'),
                ),
              ),
              GridColumn(
                columnName: 'fileUpload',
                label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('File Upload'),
                ),
              ),
            ],
          )),)
      ,
    )


    ;

  }
}

class CourseFileDataSource extends DataGridSource {
  CourseFileDataSource({required List courseFileData}) {
    _courseFileData = courseFileData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String?>(columnName: 'fileNameEn', value:'' + e.fileNameEn),
      DataGridCell<String?>(columnName: 'filePath', value: e.filePath),
      DataGridCell<String?>(columnName: 'collegeNameEn', value: e.collegeNameEn),
      DataGridCell<String?>(columnName: 'coursesNameEn', value: e.coursesNameEn),
      DataGridCell<String?>(columnName: 'usersName', value: e.usersName),
      DataGridCell<String?>(columnName: 'fileUpload', value: e.fileUpload),
    ]))
        .toList();
  }

  List<DataGridRow> _courseFileData = [];

  @override
  List<DataGridRow> get rows => _courseFileData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            child: Text(e.value.toString()),
          );
        }).toList());
  }
}


List<coursefile_model> getCourseFileData() {
  return [
    coursefile_model(
      fileId: '10001',
      fileNameEn: 'James',
      filePath: 'Project Lead',
      fileActive: '20000',
      collegeNameEn: 'College 1',
      coursesNameEn: 'Course 1',
      usersName: 'User 1',
      fileUpload: 'Upload 1',
    ),
    coursefile_model(
      fileId: '10002',
      fileNameEn: 'Kathryn',
      filePath: 'Manager',
      fileActive: '30000',
      collegeNameEn: 'College 2',
      coursesNameEn: 'Course 2',
      usersName: 'User 2',
      fileUpload: 'Upload 2',
    ),
  ];
}


