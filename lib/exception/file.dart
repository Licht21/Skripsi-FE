class InvalidImageFormatException implements Exception {
  final String message;

  const InvalidImageFormatException([
    this.message =
        'Format gambar tidak didukung. Harap unggah file JPG atau JPEG.',
  ]);

  @override
  String toString() => message;
}

class ImageTooLargeException implements Exception {
  final String message;

  const ImageTooLargeException([
    this.message =
        'Ukuran gambar melebihi batas maksimum 5 MB. Silakan pilih gambar yang lebih kecil.',
  ]);

  @override
  String toString() => message;
}

class ImageOODException implements Exception {
  final String message;

  const ImageOODException([
    this.message =
        'Gambar terindikasi bukan luka bakar. Silahkan ambil ulang gambar',
  ]);

  @override
  String toString() => message;
}
