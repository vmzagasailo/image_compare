import 'dart:io';
import 'package:image_picker/image_picker.dart';

/// Functions utils which we use in the app
class FunctionUtils {
  /// Method for pick image from gallery
  static Future<File?> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    final img = File(image.path);

    return img;
  }
}
