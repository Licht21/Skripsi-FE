import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend_burns/components/loading.dart';
import 'package:frontend_burns/exception/file.dart';
import 'package:frontend_burns/global/burn_image.dart';
import 'package:frontend_burns/state/prediction_notifier.dart';
import 'package:frontend_burns/utilities/image_validator.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

import '../utilities/predict.dart';

class ImageUploadSection extends StatefulWidget {
  const ImageUploadSection({super.key});

  @override
  State<ImageUploadSection> createState() => _ImageUploadSectionState();
}

class _ImageUploadSectionState extends State<ImageUploadSection> {
  final ImagePicker _picker = ImagePicker();

  void _showImageSourcePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Buka Kamera'),
                onTap: () {
                  Navigator.pop(context);
                  _openCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pilih dari Galeri'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      final bytes = await image.readAsBytes();

      setState(() {
        BurnImage.selectedImage = bytes;
      });
      PredictionNotifier.isUploaded.value = true;
      PredictionNotifier.isClassified.value = false;
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final bytes = await image.readAsBytes();

      setState(() {
        BurnImage.selectedImage = bytes;
      });
      PredictionNotifier.isUploaded.value = true;
      PredictionNotifier.isClassified.value = false;
    }
  }

  void _showError(BuildContext context, String message) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black54, // Efek gelap transparan pada latar belakang
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (ctx, anim1, anim2) => const SizedBox.shrink(),
      transitionBuilder: (ctx, anim, anim2, child) {
        return Transform.scale(
          scale: anim.value,
          child: FadeTransition(
            opacity: anim,
            child: AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  16,
                ), // Sudut melengkung modern
              ),
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              content: Column(
                mainAxisSize: MainAxisSize.min, // Agar dialog pas dengan konten
                children: [
                  // Container Icon Error yang Lebih Estetik
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.error_outline_rounded,
                      size: 48,
                      color: Colors.red.shade600,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Judul Dialog
                  const Text(
                    'Unggah Gambar Gagal',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E1E),
                      fontFamily:
                          'Roboto', // Sesuaikan dengan font aplikasi Anda
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),

                  // Isi Pesan Error
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // Tombol Aksi Kustom (Lebih Menarik dibanding TextButton Biasa)
                  SizedBox(
                    width: double.infinity, // Tombol memenuhi lebar dialog
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF2196F3,
                        ), // Warna biru tema utama aplikasi Anda
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: PredictionNotifier.isLoading,
      builder: (context, isLoading, child) {
        if (isLoading) {
          return LoadingWidget();
        }
        return Container(
          padding: EdgeInsetsGeometry.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(10),
            border: Border.all(color: Colors.white),
            color: Colors.white,
          ),
          child: ValueListenableBuilder(
            valueListenable: PredictionNotifier.isClassified,
            builder: (BuildContext context, value, _) {
              return ValueListenableBuilder(
                valueListenable: PredictionNotifier.isUploaded,
                builder: (ctx, isUploaded, _) {
                  return BurnImage.selectedImage == null ||
                          value == true && isUploaded == false
                      ? Center(
                          child: Column(
                            children: [
                              Icon(Icons.cloud_upload_outlined, size: 96),
                              const Text(
                                "Unggah Gambar Luka Bakar",
                                style: TextStyle(fontSize: 24),
                              ),
                              const SizedBox.square(dimension: 10),
                              const Text(
                                "Format: .JPG, JPEG",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox.square(dimension: 10),
                              const Text(
                                "Ukuran Maksimal: 5MB",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox.square(dimension: 30),
                              SizedBox(
                                width: 200,
                                child: FloatingActionButton(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.upload),
                                      const Text("Pilih Gambar"),
                                    ],
                                  ),
                                  onPressed: () {
                                    _showImageSourcePicker(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Column(
                            children: [
                              ClipRRect(
                                child: Image.memory(
                                  BurnImage.selectedImage!,
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                              const SizedBox.square(dimension: 30),
                              SizedBox(
                                width: 200,
                                child: FloatingActionButton(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Klasifikasi Gambar"),
                                    ],
                                  ),
                                  onPressed: () async {
                                    try {
                                      ImageValidator.validate(
                                        BurnImage.selectedImage!,
                                      );

                                      PredictionNotifier.isLoading.value = true;
                                      await Predict.predict(
                                        BurnImage.selectedImage!,
                                      );
                                    } on InvalidImageFormatException catch (e) {
                                      PredictionNotifier.isLoading.value =
                                          false;
                                      BurnImage.selectedImage = null;
                                      PredictionNotifier.isUploaded.value =
                                          false;
                                      _showError(context, e.message);
                                    } on ImageTooLargeException catch (e) {
                                      PredictionNotifier.isLoading.value =
                                          false;
                                      BurnImage.selectedImage = null;
                                      PredictionNotifier.isUploaded.value =
                                          false;
                                      _showError(context, e.message);
                                    } on ImageOODException catch (e) {
                                      PredictionNotifier.isLoading.value =
                                          false;
                                      _showError(this.context, e.message);
                                      BurnImage.selectedImage = null;
                                    } catch (e) {
                                      PredictionNotifier.isLoading.value =
                                          false;
                                      BurnImage.selectedImage = null;
                                      PredictionNotifier.isUploaded.value =
                                          false;
                                      _showError(
                                        context,
                                        'Terjadi kesalahan saat memproses gambar.',
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                },
              );
            },
          ),
        );
      },
    );
  }
}
