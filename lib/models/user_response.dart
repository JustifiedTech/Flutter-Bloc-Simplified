import 'dart:convert';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  bool? success;
  Data? data;
  String? message;

  ApiResponse({this.success, this.data, this.message});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? pay;
  String? targetType;
  String? profileImage;
  String? cloudImage;
  bool? isDeleted;
  String? doribinSerialNo;
  bool? disabled;
  bool? unverified;
  bool? active;
  String? deletedAt;
  bool? firstTimeLogin;
  String? sId;
  String? designation;
  String? firstName;
  String? lastName;
  String? phone;
  String? regNo;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.pay,
      this.targetType,
      this.profileImage,
      this.cloudImage,
      this.isDeleted,
      this.doribinSerialNo,
      this.disabled,
      this.unverified,
      this.active,
      this.deletedAt,
      this.firstTimeLogin,
      this.sId,
      this.designation,
      this.firstName,
      this.lastName,
      this.phone,
      this.regNo,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    pay = json['pay'];
    targetType = json['targetType'];
    profileImage = json['profileImage'];
    cloudImage = json['cloudImage'];
    isDeleted = json['isDeleted'];
    doribinSerialNo = json['doribinSerialNo'];
    disabled = json['disabled'];
    unverified = json['unverified'];
    active = json['active'];
    deletedAt = json['deletedAt'];
    firstTimeLogin = json['firstTimeLogin'];
    sId = json['_id'];
    designation = json['designation'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    regNo = json['regNo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pay'] = pay;
    data['targetType'] = targetType;
    data['profileImage'] = profileImage;
    data['cloudImage'] = cloudImage;
    data['isDeleted'] = isDeleted;
    data['doribinSerialNo'] = doribinSerialNo;
    data['disabled'] = disabled;
    data['unverified'] = unverified;
    data['active'] = active;
    data['deletedAt'] = deletedAt;
    data['firstTimeLogin'] = firstTimeLogin;
    data['_id'] = sId;
    data['designation'] = designation;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['regNo'] = regNo;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
