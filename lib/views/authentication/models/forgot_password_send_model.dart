class ForgotPasswordSendModel {
  String? email;
  String? role;

  ForgotPasswordSendModel({this.email, this.role});

  ForgotPasswordSendModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}