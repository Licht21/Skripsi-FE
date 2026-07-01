import 'package:flutter/material.dart';

class MobileTipsTakingPictures extends StatelessWidget {
  const MobileTipsTakingPictures({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.camera_alt_outlined, size: 32),
              const SizedBox.square(dimension: 20),
              const Text(
                "Tips Mengambil Gambar",
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          const SizedBox.square(dimension: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.sunny, size: 32),
              const SizedBox.square(dimension: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Gunakan pencahayaan yang cukup",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "Pencahayaan terang dan merata membantu sistem mengenali luka dengan lebih baik",
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox.square(dimension: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.center_focus_strong_outlined, size: 32),
              const SizedBox.square(dimension: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Fokus pada area luka",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "Pastikan area luka terlihat jelas dan tidak terhalang objek lain",
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox.square(dimension: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.social_distance_rounded, size: 32),
              const SizedBox.square(dimension: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ambil dari jarak yang sesuai",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "Jarak terlalu dekat atau jauh dapat mempengaruhi hasil klasifikasi",
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox.square(dimension: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.photo_camera_back, size: 32),
              const SizedBox.square(dimension: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Gunakan latar belakang netral",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "Hindari latar belakang yang ramai agar fokus pada luka",
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox.square(dimension: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.phone_android, size: 32),
              const SizedBox.square(dimension: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Jangan bergerak saat memotret",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "Pastikan kamera stabil agar gambar tidak buram",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
