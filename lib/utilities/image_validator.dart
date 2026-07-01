import 'dart:typed_data';

import 'package:frontend_burns/exception/file.dart';

class ImageValidator {
  static const int maxSizeBytes = 5 * 1024 * 1024;

  static void validate(Uint8List bytes) {
    // Validasi ukuran
    if (bytes.lengthInBytes > maxSizeBytes) {
      throw const ImageTooLargeException();
    }

    // Validasi JPG/JPEG
    if (!_isJpeg(bytes)) {
      throw const InvalidImageFormatException();
    }
  }

  static bool _isJpeg(Uint8List bytes) {
    if (bytes.length < 4) return false;

    return bytes[0] == 0xFF &&
        bytes[1] == 0xD8 &&
        bytes[bytes.length - 2] == 0xFF &&
        bytes[bytes.length - 1] == 0xD9;
  }
}
