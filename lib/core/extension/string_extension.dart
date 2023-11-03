import 'package:jiffy/jiffy.dart';

extension DateParser on String {
  DateTime parseStringToDateTime() {
    return Jiffy.parse(this, pattern: "dd-MM-yyyy").dateTime;
  }
}
