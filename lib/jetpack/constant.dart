
import 'package:flutter/material.dart';

class Constant{
  static List<DropdownMenuItem> buildMinimumApiList() {
    final List<DropdownMenuItem> items = [];
    final DropdownMenuItem api16 = DropdownMenuItem(
      value: "16",
      child: Text("API 16: Android 4.1"),
    );
    final DropdownMenuItem api17 = DropdownMenuItem(
      value: "17",
      child: Text("API 17: Android 4.2"),
    );
    final DropdownMenuItem api18 = DropdownMenuItem(
      value: "18",
      child: Text("API 18: Android 4.3"),
    );
    final DropdownMenuItem api19 = DropdownMenuItem(
      value: "19",
      child: Text("API 19: Android 4.4"),
    );
    final DropdownMenuItem api20 = DropdownMenuItem(
      value: "20",
      child: Text("API 20: Android 4.4W"),
    );
    final DropdownMenuItem api21 = DropdownMenuItem(
      value: "21",
      child: Text("API 21: Android 5.0"),
    );
    final DropdownMenuItem api22 = DropdownMenuItem(
      value: "22",
      child: Text("API 22: Android 5.1"),
    );
    final DropdownMenuItem api23 = DropdownMenuItem(
      value: "23",
      child: Text("API 23: Android 6.0"),
    );
    final DropdownMenuItem api24 = DropdownMenuItem(
      value: "24",
      child: Text("API 24: Android 7.0"),
    );
    final DropdownMenuItem api25 = DropdownMenuItem(
      value: "25",
      child: Text("API 25: Android 7.1.1"),
    );
    final DropdownMenuItem api26 = DropdownMenuItem(
      value: "26",
      child: Text("API 26: Android 8.0"),
    );
    final DropdownMenuItem api27 = DropdownMenuItem(
      value: "27",
      child: Text("API 27: Android 8.1"),
    );
    final DropdownMenuItem api28 = DropdownMenuItem(
      value: "28",
      child: Text("API 28: Android 9.0"),
    );
    final DropdownMenuItem api29 = DropdownMenuItem(
      value: "29",
      child: Text("API 29: Android 10.0"),
    );
    items.add(api16);
    items.add(api17);
    items.add(api18);
    items.add(api19);
    items.add(api20);
    items.add(api21);
    items.add(api22);
    items.add(api23);
    items.add(api24);
    items.add(api25);
    items.add(api26);
    items.add(api27);
    items.add(api28);
    items.add(api29);
    return items;
  }
}