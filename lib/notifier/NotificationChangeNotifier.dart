import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/course_model.dart';
import '../model/post_model.dart';
import '../utils/Constant.dart';

class NotificationChangeNotifier extends ChangeNotifier {
  bool isLoaded = false;
  List<Post> courseModelList = [];

  void initState() async {
    await getAllCourseData();
    isLoaded = true;
    notifyListeners();
  }

  Future<List<Post>> getAllCourseData() async {
    final response = await http
        .get(Uri.parse(Constant.ADMIN_PANEL_URL + Constant.POST_PANEL_URL));
    var data = jsonDecode(response.body.toString());
    CourseModel? courseModel;

    if (response.statusCode == 200) {
      courseModel = CourseModel.fromJson(data);
      for (var element in courseModel.posts) {
        courseModelList.add(element);
      }
      return courseModelList;
    } else {
      return courseModelList;
    }
  }
}
