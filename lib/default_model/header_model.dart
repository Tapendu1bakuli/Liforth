import 'package:meta/meta.dart';

class HeaderModel {
  HeaderModel({
    @required this.token,
  });

  final String? token;

  factory HeaderModel.fromJson(Map<String, String> json) => HeaderModel(
    token: json["Authorization"],
  );

  Map<String, String> toHeader() => {
    "Authorization": token!,
  };
}