import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

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
}
