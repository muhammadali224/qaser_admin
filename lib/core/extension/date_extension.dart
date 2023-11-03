import 'package:jiffy/jiffy.dart';

extension DateParser on DateTime {
  String parseDate() {
    return Jiffy.parseFromDateTime(this)
        .format(pattern: "dd-MM-yyyy")
        .toString();
  }
}
