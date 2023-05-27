import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/course_model.dart';
import '../model/post_model.dart';
import '../utils/Constant.dart';

class HomeChangeNotifier extends ChangeNotifier {
  bool isLoaded = false;
  List<Post> popularCourseList = [];

  void initState() async {
    await getPopularCoursesData();
    isLoaded = true;
    notifyListeners();
  }

  Future<void> getPopularCoursesData() async {
    final response = await http
        .get(Uri.parse(Constant.ADMIN_PANEL_URL + Constant.POST_PANEL_URL));
    var data = jsonDecode(response.body.toString());
    CourseModel? courseModel;

    if (response.statusCode == 200) {
      courseModel = CourseModel.fromJson(data);
      popularCourseList = courseModel.posts.take(4).toList();
    }
  }
}
