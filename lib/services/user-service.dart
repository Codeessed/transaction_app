import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cashir_app/data/ErrorMessages.dart';
import 'package:cashir_app/helper/constants/app-endpoint.dart';
import 'package:cashir_app/model/data/user-details.model.dart';
import 'package:cashir_app/model/data/user-response.model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  var client = http.Client();

  Future<UserResponseModel> signUp() async {
    try {
      var response = await client
          .get(Uri.parse("${BASEURL}test/dev"), headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
      });
      var data = jsonDecode(response.body);
      print('start');
      print(data);
      print(response.body);
      print(response.statusCode);
      print(data);
      // return data as Map<dynamic, dynamic>;
      // (
      // print('translated ${UserDetailsModel.fromJson(data as Map<String, dynamic>)}');
      return UserResponseModel.fromJson(data);
    } on SocketException catch (_) {
      throw ErrorResponse("No internet connection");
    } on HttpException catch (_) {
      throw ErrorResponse("Service not currently available");
    } on TimeoutException catch (_) {
      throw ErrorResponse("Poor internet connection");
    } catch (e) {
      print(e.toString());
      throw ErrorResponse("Something went wrong. Try again");
    }
  }


}