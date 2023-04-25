// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, avoid_print

import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);

  if (_file != null) {
    return _file.readAsBytes();
  }
  print("No Image selected");
}
