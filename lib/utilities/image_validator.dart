import 'dart:typed_data';

import 'package:frontend_burns/exception/file.dart';

class ImageValidator {
  static const int maxSizeBytes = 5 * 1024 * 1024;

  static void validate(Uint8List bytes) {
    // Validasi ukuran
    if (bytes.lengthInBytes > maxSizeBytes) {
      throw const ImageTooLargeException();
    }

    // Validasi JPG/JPEG atau PNG
    if (!_isJpeg(bytes) && !_isPng(bytes)) {
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

  static bool _isPng(Uint8List bytes) {
    if (bytes.length < 8) return false;

    return bytes[0] == 0x89 &&
        bytes[1] == 0x50 && // P
        bytes[2] == 0x4E && // N
        bytes[3] == 0x47 && // G
        bytes[4] == 0x0D &&
        bytes[5] == 0x0A &&
        bytes[6] == 0x1A &&
        bytes[7] == 0x0A;
  }
}
