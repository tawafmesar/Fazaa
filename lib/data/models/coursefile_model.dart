class coursefile_model {
  String? fileId;
  String? fileNameEn;
  String? filePath;
  String? fileActive;
  String? collegeNameEn;
  String? coursesNameEn;
  String? usersName;
  String? fileUpload;

  coursefile_model(
      {this.fileId,
        this.fileNameEn,
        this.filePath,
        this.fileActive,
        this.collegeNameEn,
        this.coursesNameEn,
        this.usersName,
        this.fileUpload});

  coursefile_model.fromJson(Map<String, dynamic> json) {
    fileId = json['file_id'];
    fileNameEn = json['file_name_en'];
    filePath = json['file_path'];
    fileActive = json['file_activie'];
    collegeNameEn = json['college_name_en'];
    coursesNameEn = json['courses_name_en'];
    usersName = json['users_name'];
    fileUpload = json['file_upload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_id'] = this.fileId;
    data['file_name_en'] = this.fileNameEn;
    data['file_path'] = this.filePath;
    data['file_activie'] = this.fileActive;
    data['college_name_en'] = this.collegeNameEn;
    data['courses_name_en'] = this.coursesNameEn;
    data['users_name'] = this.usersName;
    data['file_upload'] = this.fileUpload;
    return data;
  }
}
