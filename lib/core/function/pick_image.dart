import 'dart:io';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource src) async {
  XFile? xFile = await ImagePicker().pickImage(source: src);
  if (xFile?.path == null) {
    return SmartDialog.showToast(
      "لم تقم بإختيار صورة",
    );
  } else {
    return File(xFile!.path);
  }
}
