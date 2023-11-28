
import 'package:cashir_app/model/data/transaction-history.model.dart';
import 'package:cashir_app/model/data/user-details.model.dart';

class ErrorResponseModel {
  String message;
  String header;
  String name;

  ErrorResponseModel({
    required this.message,
    required this.header,
    required this.name,
  });

  Map toJson() {
    return {
      "message": message,
      "header": header,
      "name": name,
    };
  }

  factory ErrorResponseModel.fromJson(Map<dynamic, dynamic> json) {
    return ErrorResponseModel(
      message:json['message'],
      header: json['header'],
      name: json['name'],
    );
  }

}
