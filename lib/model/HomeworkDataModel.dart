import 'dart:convert';

HomeworkDataModel homeworkDataModelFromJson(String str) =>
    HomeworkDataModel.fromJson(json.decode(str));

class HomeworkDataModel {
  String message;
  String status;
  List<HomeworkDatum>? data;

  HomeworkDataModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory HomeworkDataModel.fromJson(Map<String, dynamic> json) =>
      HomeworkDataModel(
        message: json["message"],
        status: json["status"],
        data: List<HomeworkDatum>.from(
            json["data"].map((x) => HomeworkDatum.fromJson(x))),
      );
}

class HomeworkDatum {
  dynamic studentRegId;
  DateTime sendDate;
  String subjectName;
  String subjectId;
  String hwDescription;
  String createdBy;
  String uploadPath;
  String uploadPath1;
  String uploadPath2;
  String uploadPath3;
  String uploadPath4;

  HomeworkDatum({
    required this.studentRegId,
    required this.sendDate,
    required this.subjectName,
    required this.subjectId,
    required this.hwDescription,
    required this.createdBy,
    required this.uploadPath,
    required this.uploadPath1,
    required this.uploadPath2,
    required this.uploadPath3,
    required this.uploadPath4,
  });

  factory HomeworkDatum.fromJson(Map<String, dynamic> json) => HomeworkDatum(
        studentRegId: json["student_reg_id"],
        sendDate: DateTime.parse(json["send_date"]),
        subjectName: json["subject_name"],
        subjectId: json["subject_id"],
        hwDescription: json["hw_description"],
        createdBy: json["created_by"],
        uploadPath: json["upload_path"],
        uploadPath1: json["upload_path1"],
        uploadPath2: json["upload_path2"],
        uploadPath3: json["upload_path3"],
        uploadPath4: json["upload_path4"],
      );
}
