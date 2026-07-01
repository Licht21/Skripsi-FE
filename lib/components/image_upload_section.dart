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
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        icon: const Icon(Icons.error_outline, size: 40),
        title: const Text('Unggah Gambar Gagal'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
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
            border: Border.all(),
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
                                      Predict.predict(BurnImage.selectedImage!);
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
                                    } on TimeoutException catch (e) {
                                      PredictionNotifier.isLoading.value =
                                          false;
                                      BurnImage.selectedImage = null;
                                      PredictionNotifier.isUploaded.value =
                                          false;
                                      _showError(
                                        context,
                                        "Server merespon terlalu lama",
                                      );
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
