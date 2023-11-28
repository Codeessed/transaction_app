
import 'package:cashir_app/model/data/error-response.model.dart';
import 'package:cashir_app/model/data/user-details.model.dart';

class UserResponseModel {
  UserDetailsModel? data;
  ErrorResponseModel? error;

  UserResponseModel({
    this.data,
    this.error
  });

  Map toJson() {
    return {
      "data": data?.toJson(),
      "error": error?.toJson(),
    };
  }

  factory UserResponseModel.fromJson(Map<dynamic, dynamic> json) {
    return UserResponseModel(
      data: json['data'] != null ? UserDetailsModel.fromJson(json['data']) : null,
      error: json['error'] != null ? ErrorResponseModel.fromJson(json['error']) : null,
    );
  }

}
