import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend_burns/exception/file.dart';
import 'package:frontend_burns/state/prediction_notifier.dart';
import 'package:frontend_burns/state/result_notifier.dart';
import 'package:http/http.dart' as http;

class Predict {
  static const URL = "http://localhost:8000/predict";

  static Future<void> predict(Uint8List image) async {
    final request = http.MultipartRequest("POST", Uri.parse(URL));

    request.files.add(
      http.MultipartFile.fromBytes("image", image, filename: "burn.jpg"),
    );

    final streamedResponse = await request.send();

    final response = await http.Response.fromStream(streamedResponse);

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 && data['classification'] == -1) {
      ResultNotifier.degree.value = data['classification'];
      print(ResultNotifier.degree.value);
      throw ImageOODException();
    } else if (response.statusCode == 200) {
      PredictionNotifier.isClassified.value = true;
      PredictionNotifier.isUploaded.value = false;
      PredictionNotifier.isLoading.value = false;
      ResultNotifier.degree.value = data['classification'];
      ResultNotifier.confidence.value = data['confidence'];
    } else {
      throw Exception("Server mengembalikan status ${response.statusCode}");
    }
  }

  static String burnsDescription(int degree) {
    switch (degree) {
      case 1:
        return "Luka bakar melibatkan epidermis. Ditandai  dengan kulit kemerahan, kering";
      case 2:
        return "Luka bakar melibatkan epidermis dan sebagian dermis. Ditandai dengan kulit merah, nyeri dan muncul lepuh";
      case 3:
        return "Luka bakar melibatkan seluruh lapisan epidermis dan dermis atau lebih dalam";
      default:
        return "";
    }
  }

  static List<Map<Widget, List<String>>> burnsEarlyHandling(int degree) {
    switch (degree) {
      case 1:
        return [
          {
            Icon(Icons.water_drop_outlined, size: 32): [
              "1. Dinginkan luka",
              "Basuh luka menggunakan air bersih mengalir selama 20 menit atau lebih",
            ],
          },
          {
            Icon(Icons.block_outlined, size: 32): [
              "2. Hindari bahan berikut",
              "Hindari bahan rumahan seperti odol, mentega, kecap, dan es",
            ],
          },
          {
            Icon(Icons.spa_outlined, size: 32): [
              "3. Lembapkan kulit",
              "Setelah dibasuh, gunakan pelembap murni seperti gel aloe vera untuk menjaga kelembapan kulit",
            ],
          },
        ];
      case 2:
        return [
          {
            Icon(Icons.local_fire_department_outlined, size: 32): [
              "1. Pindahkan korban",
              "Segera pindahkan korban dari sumber panas sesegera mungkin",
            ],
          },
          {
            Icon(Icons.checkroom, size: 32): [
              "2. Lepaskan pakaian",
              "Lepaskan pakaian atau aksesoris pada bagian yang tidak melekat pada luka. Jika pakaian atau aksesoris melekat pada permukaan luka, jangan dilepas dan tunggu tenaga medis",
            ],
          },
          {
            Icon(Icons.water_drop_outlined, size: 32): [
              "3. Dinginkan Luka",
              "Basuh luka dengan air bersih mengalir minimal 20 menit sesegera mungkin",
            ],
          },
          {
            Icon(Icons.block_outlined, size: 32): [
              "4. Hindari hal berikut",
              "Hindari bahan rumah seperti mentega, pasta gigi, kecap dan es. Jangan memecahkan kantung lepuh (blister).",
            ],
          },
          {
            Icon(Icons.medical_services_outlined, size: 32): [
              "5. Tutup luka",
              "Tutup area luka secara longgar menggunakan kain kasa steril atau kain bersih yang tidak berserat",
            ],
          },
          {
            Icon(Icons.local_hospital_outlined, size: 32): [
              "6. Panggil tenaga medis",
              "Jika area luka luas atau mengenai area wajah, tangan, kaki, bokong, selangkangan wajib meminta pertolongan ke tenaga medis",
            ],
          },
        ];
      case 3:
        return [
          {
            Icon(Icons.local_hospital_outlined, size: 32): [
              "1. Panggil tenaga medis",
              "Secepatnya panggil tenaga medis",
            ],
          },
          {
            Icon(Icons.local_fire_department_outlined, size: 32): [
              "2. Pindahkan korban",
              "Jauhkan korban dari sumber kebakaran maupun asap",
            ],
          },
          {
            Icon(Icons.checkroom, size: 32): [
              "3. Lepaskan pakaian",
              "Lepaskan pakaian atau aksesoris yang tidak melekat pada luka bakar. Jangan melepas pakaian yang melekat",
            ],
          },
          {
            Icon(Icons.block_outlined, size: 32): [
              "4. Hindari hal berikut",
              "Hindari penggunaan bahan rumahan seperti mentega, pasta gigi, kecap, dan es",
            ],
          },
          {
            Icon(Icons.medical_services_outlined, size: 32): [
              "5. Tutup luka",
              "Tutup area luka bakar menggunakan kain steril",
            ],
          },
        ];
      default:
        return [{}];
    }
  }
}
