import 'package:flutter/cupertino.dart';

class ProfileGridViewModel {
  Widget topWidget;
  Widget bottomText;
  ProfileGridViewModel({required this.topWidget,required this.bottomText});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topWidget'] = this.topWidget;
    data['bottomText'] = this.bottomText;
    return data;
  }
}