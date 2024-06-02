class SignUpSendModel {
  String? email;
  String? password;
  String? fullName;

  SignUpSendModel({this.email, this.password, this.fullName});

  SignUpSendModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['fullName'] = this.fullName;
    return data;
  }
}
