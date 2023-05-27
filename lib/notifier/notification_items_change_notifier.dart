import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

import '../model/post_model.dart';

class NotifyItemChangeNotifier extends ChangeNotifier {
  Post notifyItem;

  NotifyItemChangeNotifier({required Post pc}) : notifyItem = pc;

  Post get category => notifyItem;

  set setNotifyItem(Post newCourse) {
    notifyItem = newCourse;
    notifyListeners();
  }

  String getFormattedTime() {
    initializeDateFormatting('bn', '').then((_) {
      final now = DateTime.now();
      final formattedTime = DateFormat('h:mm a', 'bn').format(now);
      return formattedTime;
    });

    return '';
  }

  void updateCategory(Post newCourse) {
    setNotifyItem = newCourse;
  }
}
