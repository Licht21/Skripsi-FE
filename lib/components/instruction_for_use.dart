import 'package:flutter/material.dart';

class InstructionForUse extends StatelessWidget {
  const InstructionForUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        padding: EdgeInsetsGeometry.all(25),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.menu_book, size: 32),
                  const SizedBox.square(dimension: 20),
                  Expanded(
                    child: Text(
                      "Petunjuk Penggunaan",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox.square(dimension: 5),
            Expanded(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadiusGeometry.circular(10),
                      color: Colors.green,
                    ),
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(
                      "1",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 20),
                  Expanded(
                    child: Text(
                      "Klik tombol 'Pilih Gambar' untuk mengunggah gambar luka bakar",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox.square(dimension: 5),
            Expanded(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadiusGeometry.circular(10),
                      color: Colors.green,
                    ),
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(
                      "2",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 20),
                  Expanded(
                    child: Text(
                      "Pastikan gambar jelas, tidak buram, dan fokus pada area luka",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox.square(dimension: 5),
            Expanded(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadiusGeometry.circular(10),
                      color: Colors.green,
                    ),
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(
                      "3",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 20),
                  Expanded(
                    child: Text(
                      "Tekan tombol klasifikasi gambar untuk memulai proses klasifikasi",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox.square(dimension: 5),
            Expanded(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadiusGeometry.circular(10),
                      color: Colors.green,
                    ),
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(
                      "4",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 20),
                  Expanded(
                    child: Text(
                      "Hasil Klasifikasi derajat luka bakar akan ditampilkan di bagian bawah",
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
