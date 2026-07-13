import 'package:flutter/material.dart';
import 'package:frontend_burns/state/prediction_notifier.dart';
import 'package:frontend_burns/state/result_notifier.dart';
import 'package:frontend_burns/utilities/predict.dart';

class MobileDetailClassificationResult extends StatefulWidget {
  const MobileDetailClassificationResult({super.key});

  @override
  State<MobileDetailClassificationResult> createState() =>
      _DetailClassificationResultState();
}

class _DetailClassificationResultState
    extends State<MobileDetailClassificationResult> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orangeAccent),
        borderRadius: BorderRadiusGeometry.circular(10),
        color: Colors.yellow.shade50,
      ),
      child: ValueListenableBuilder(
        valueListenable: PredictionNotifier.isClassified,
        builder: (builder, value, _) {
          return value
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Hasil Prediksi",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox.square(dimension: 10),
                    Container(
                      padding: EdgeInsetsGeometry.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade600,
                          width: 2,
                        ),
                        borderRadius: BorderRadiusGeometry.circular(10),
                        color: Colors.grey.shade300,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Tingkat Luka Bakar",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox.square(dimension: 10),
                          Text(
                            "Luka Bakar Derajat ${ResultNotifier.degree.value}",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.military_tech_outlined),
                                const Text("Tingkat Keyakinan "),
                                Text("${ResultNotifier.confidence.value}%"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox.square(dimension: 10),
                    Container(
                      padding: EdgeInsetsGeometry.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade600,
                          width: 2,
                        ),
                        borderRadius: BorderRadiusGeometry.circular(10),
                        color: Colors.grey.shade300,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.notes),
                              const SizedBox.square(dimension: 10),
                              const Text(
                                "Deskripsi",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Text(
                            Predict.burnsDescription(
                              ResultNotifier.degree.value!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.analytics_outlined,
                          size: 70,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Belum Ada Hasil Klasifikasi',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Unggah gambar luka bakar dan tekan tombol '
                          '"Klasifikasi" untuk melihat hasil prediksi.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
