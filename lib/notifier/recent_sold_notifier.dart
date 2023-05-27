import 'package:flutter/cupertino.dart';

import '../model/post_model.dart';

class RecentSoldNotifier extends ChangeNotifier {
  Post popularCourse;

  RecentSoldNotifier({required Post pc}) : popularCourse = pc;

  Post get category => popularCourse;

  set setPopularCourse(Post newCourse) {
    popularCourse = newCourse;
    notifyListeners();
  }

  void updateCategory(Post newCourse) {
    setPopularCourse = newCourse;
  }
}
