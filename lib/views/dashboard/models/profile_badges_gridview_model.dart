import 'package:flutter/cupertino.dart';

class ProfileBadgesGridViewModel {
  Widget badges;
  ProfileBadgesGridViewModel({required this.badges});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['badges'] = this.badges;
    return data;
  }
}