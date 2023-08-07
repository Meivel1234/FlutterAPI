import 'dart:convert';

EnoticeDataModel enoticeDataModelFromJson(String str) =>
    EnoticeDataModel.fromJson(json.decode(str));

class EnoticeDataModel {
  String message;
  String status;
  List<EnoticeDatum>? data;

  EnoticeDataModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory EnoticeDataModel.fromJson(Map<String, dynamic> json) =>
      EnoticeDataModel(
        message: json["message"],
        status: json["status"],
        data: List<EnoticeDatum>.from(
            json["data"].map((x) => EnoticeDatum.fromJson(x))),
      );
}

class EnoticeDatum {
  DateTime? sendDate;
  String? description;
  String? createdBy;
  String? uploadPath;
  String? uploadPath1;
  String? uploadPath2;
  String? uploadPath3;
  String? uploadPath4;

  EnoticeDatum({
    required this.sendDate,
    required this.description,
    required this.createdBy,
    required this.uploadPath,
    required this.uploadPath1,
    required this.uploadPath2,
    required this.uploadPath3,
    required this.uploadPath4,
  });

  factory EnoticeDatum.fromJson(Map<String, dynamic> json) => EnoticeDatum(
        sendDate: DateTime.parse(json["send_date"]),
        description: json["description"],
        createdBy: json["created_by"],
        uploadPath: json["upload_path"],
        uploadPath1: json["upload_path1"],
        uploadPath2: json["upload_path2"],
        uploadPath3: json["upload_path3"],
        uploadPath4: json["upload_path4"],
      );
}
