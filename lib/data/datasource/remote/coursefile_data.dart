import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';


class CourseFileData {
  Crud crud;
  CourseFileData(this.crud);

  getCollege() async {
    var response = await crud.postData(AppLink.viewcollege, {});
    return response.fold((l) => l, (r) => r);
  }

  getCourse(String id ) async {
    var response = await crud.postData(AppLink.viewcourse, {
      "id" : id ,
    });
    return response.fold((l) => l, (r) => r);
  }

  getFile(String id ) async {
    var response = await crud.postData(AppLink.viewfiles, {
      "id" : id ,
    });
    return response.fold((l) => l, (r) => r);
  }

  addFile(Map data, File file ) async {
    var response = await crud.addRequestWithImageOne(AppLink.addfile ,data,file );
    return response.fold((l) => l, (r) => r);
  }


  getcoursefile() async {
    var response = await crud.postData(AppLink.viewcoursefile, {});
    return response.fold((l) => l, (r) => r);
  }


}