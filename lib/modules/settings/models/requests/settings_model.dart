import 'dart:ffi';

import 'package:flutter/cupertino.dart';

/// Represents some descriptive information about a [SettingsModel].
class SettingsModel {
  int? id;
  bool? isOn;
  String? title;
  String? subTitle;
  IconData? icon;

  SettingsModel({this.id, this.isOn, this.title, this.subTitle, this.icon});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isOn = json['isOn'];
    title = json['first_name'];
    subTitle = json['last_name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isOn'] = isOn;
    data['first_name'] = title;
    data['last_name'] = subTitle;
    data['icon'] = icon;
    return data;
  }
}
