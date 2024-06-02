class LoginResponseModel {
  bool? success;
  Data? data;
  String? message;

  LoginResponseModel({this.success, this.data, this.message});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? token;
  String? fullName;
  String? userUniqueId;
  String? email;
  String? role;
  String? profilePicture;

  Data(
      {this.token,
      this.fullName,
      this.userUniqueId,
      this.email,
      this.role,
      this.profilePicture});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    fullName = json['fullName'];
    userUniqueId = json['userUniqueId'];
    email = json['email'];
    role = json['role'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['fullName'] = this.fullName;
    data['userUniqueId'] = this.userUniqueId;
    data['email'] = this.email;
    data['role'] = this.role;
    data['profile_picture'] = this.profilePicture;
    return data;
  }
}
