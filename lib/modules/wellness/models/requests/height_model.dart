
import 'package:flutter/cupertino.dart';

/// Represents some descriptive information about a [SettingsModel].
class HeightModel {
  String? title;
  String? type;

  HeightModel({ this.title, this.type});


  HeightModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    return data;
  }
}
