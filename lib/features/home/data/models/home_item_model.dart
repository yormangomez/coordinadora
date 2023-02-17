import 'package:flutter/material.dart';

class HomeItemModel {
  HomeItemModel({
    required this.iconData,
    this.color,
  });

  IconData iconData;
  Color? color;

  factory HomeItemModel.fromJson(Map<String, dynamic> json) => HomeItemModel(
        iconData: json["icon"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "icon": iconData,
        "color": color,
      };
}
