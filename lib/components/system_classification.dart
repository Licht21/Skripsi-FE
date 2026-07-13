import 'package:flutter/material.dart';
import 'package:frontend_burns/components/image_upload_section.dart';

class SystemClassification extends StatelessWidget {
  const SystemClassification({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadiusGeometry.circular(10),
          color: Colors.blueAccent.shade700,
        ),
        padding: EdgeInsetsGeometry.all(25),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Klasifikasi Luka Bakar",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 20),
                  Expanded(
                    child: Text(
                      "Sistem ini menggunakan model deep learning MobileNetV2 untuk mengklasifikasi derajat luka bakar",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 20),
                  Expanded(
                    child: Text(
                      "Unggah citra luka bakar untuk mendapatkan hasil klasifikasi",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Icon(
                        Icons.medical_services_outlined,
                        size: 96,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox.square(dimension: 20),
            Expanded(flex: 2, child: ImageUploadSection()),
          ],
        ),
      ),
    );
  }
}
