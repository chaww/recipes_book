// ignore_for_file: public_member_api_docs

import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class RecipesImages {
  const RecipesImages();

  Future<List<String>?> displayPickImageDialog({
    double? maxWidth = 1500,
    double? maxHeight = 1500,
  }) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
    final mediaFileList = image == null ? null : <XFile>[image];
    final mime = lookupMimeType(mediaFileList![0].path);
    if (mime == null || mime.startsWith('image/')) {
      return [...mediaFileList.map((e) => e.path)];
    } else {
      return null;
    }
  }

  Future<String> handleImagePath({
    required String source,
  }) async {
    if (source.isNotEmpty && source.contains('/cache/')) {
      final appDocDir = await getApplicationDocumentsDirectory();
      final dirPath = appDocDir.path;
      final fileType = source.split('.').last;
      final file = File(source);
      final filename = const Uuid().v4();
      final newImage = await file.copy('$dirPath/$filename.$fileType');
      return newImage.path;
    } else {
      return source;
    }
  }
}
