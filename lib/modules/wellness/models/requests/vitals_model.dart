
import 'package:flutter/cupertino.dart';

/// Represents some descriptive information about a [SettingsModel].
class VitalsModel {
  int? id;
  String? title;
  String? subTitle;
  String? date;
  IconData? icon;

  VitalsModel({this.id, this.date, this.title, this.subTitle, this.icon});


  VitalsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    title = json['title'];
    subTitle = json['subTitle'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['icon'] = icon;
    return data;
  }
}
