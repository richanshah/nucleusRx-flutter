
import 'package:flutter/cupertino.dart';

/// Represents some descriptive information about a [SettingsModel].
class WeightModel {
  int? id;
  String? title;
  String? type;
  String? date;

  WeightModel({this.id, this.date, this.title, this.type});


  WeightModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['title'] = title;
    data['type'] = type;
    return data;
  }
}
