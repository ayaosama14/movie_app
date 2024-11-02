import 'dart:developer';

class APIResponse {
  bool? status;
  int? code;
  String? message;
  dynamic data;

  APIResponse({this.status, this.code, this.message, this.data});

  APIResponse.fromJSON(Map<String, dynamic> json) {
    // log("WE ARE HERE WITH STATUS CODE: ${json['code']}");
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }
}
