import 'package:flutter/material.dart';

class TipsTakingPictures extends StatelessWidget {
  const TipsTakingPictures({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadiusGeometry.circular(10),
          color: Colors.green.shade50,
        ),
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 32,
                      color: Colors.green.shade800,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Tips Mengambil Gambar",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.green.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Icon(
                      Icons.sunny,
                      size: 32,
                      color: Colors.green.shade800,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Gunakan pencahayaan yang cukup",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Flexible(
                          child: const Text(
                            "Pencahayaan terang dan merata membantu sistem mengenali luka dengan lebih baik",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Icon(
                      Icons.center_focus_strong_outlined,
                      size: 32,
                      color: Colors.green.shade800,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Fokus pada area luka",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Flexible(
                          child: const Text(
                            "Pastikan area luka terlihat jelas dan tidak terhalang objek lain",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Icon(
                      Icons.social_distance_rounded,
                      size: 32,
                      color: Colors.green.shade800,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ambil dari jarak yang sesuai",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Flexible(
                          child: const Text(
                            "Jarak terlalu dekat atau jauh dapat mempengaruhi hasil klasifikasi",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Icon(
                      Icons.photo_camera_back,
                      size: 32,
                      color: Colors.green.shade800,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Gunakan latar belakang netral",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Flexible(
                          child: const Text(
                            "Hindari latar belakang yang ramai agar fokus pada luka",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Icon(
                      Icons.phone_android,
                      size: 32,
                      color: Colors.green.shade800,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Jangan bergerak saat memotret",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Flexible(
                          child: const Text(
                            "Pastikan kamera stabil agar gambar tidak buram",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
