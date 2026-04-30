class BaseApiModel {
  int? statusCode;
  bool? status;
  String? message;
  dynamic data;

  BaseApiModel({this.statusCode, this.status, this.message, this.data});

  factory BaseApiModel.fromJson(Map<String, dynamic> json) {
    return BaseApiModel(
      statusCode: json['statusCode'],
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'status': status,
      'message': message,
      'data': data,
    };
  }
}
