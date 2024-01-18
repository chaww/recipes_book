import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

/// {@template recipes_images}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class RecipesImages {
  /// {@macro recipes_images}
  const RecipesImages();

  Future<void> displayPickImageDialog() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1600,
      maxHeight: 1600,
    );
    final mediaFileList = image == null ? null : <XFile>[image];
    final mime = lookupMimeType(mediaFileList![0].path);

    log(mediaFileList![0].path);
  }
}
