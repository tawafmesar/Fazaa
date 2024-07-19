

import 'dart:io';

import 'package:file_picker/file_picker.dart';

imageUploadCamera(){


}

fileUploadGallery([isImage = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type:  FileType.custom,
    allowedExtensions: ["jpg", "png", "gif", "mp3", "pdf", "doc", "docx", "ppt", "pptx", "xls", "xlsx"]
  );

  if(result != null){
    return File(result.files.single.path!);
  }else{
    return null;
  }


}