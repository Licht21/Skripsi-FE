import 'package:flutter/material.dart';
import 'package:frontend_burns/components/image_upload_section.dart';

class MobileSystemClassification extends StatelessWidget {
  const MobileSystemClassification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      padding: EdgeInsetsGeometry.all(25),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Klasifikasi Luka Bakar",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
              ),
              const SizedBox.square(dimension: 20),
              Text(
                "Sistem ini menggunakan model deep learning MobileNetV2 untuk mengklasifikasi derajat luka bakar",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
              ),
              const SizedBox.square(dimension: 20),
              Text(
                "Unggah citra luka bakar untuk mendapatkan hasil klasifikasi",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
              ),
              Center(child: Icon(Icons.medical_services_outlined, size: 96)),
            ],
          ),
        ],
      ),
    );
  }
}
