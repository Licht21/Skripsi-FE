import 'package:flutter/material.dart';

class SystemInformation extends StatelessWidget {
  const SystemInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadiusGeometry.circular(10),
          color: Colors.lightBlue.shade50,
        ),
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(Icons.info_outline, size: 24),
                  const SizedBox.square(dimension: 10),
                  Expanded(
                    child: Text(
                      "Informasi Sistem",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Sistem ini menggunakan model MobileNetV2 yang telah dilatih untuk mengklasifikasi luka bakar ke dalam 3 kategori: Derajat 1, 2, 3.",
                      style: TextStyle(fontSize: 16),
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
