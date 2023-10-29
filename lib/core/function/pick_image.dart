import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:image_picker/image_picker.dart';

import 'show_snackbar.dart';

pickImage(ImageSource src) async {
  XFile? xFile = await ImagePicker().pickImage(source: src);
  if (xFile?.path == null) {
    return showSnackBar(
      "error".tr,
      "لم تقم بإختيار صورة",
      IconBroken.Image,
      color: Colors.red,
    );
  } else {
    return File(xFile!.path);
  }
}
