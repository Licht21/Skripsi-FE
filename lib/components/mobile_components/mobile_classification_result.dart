import 'package:flutter/material.dart';
import 'package:frontend_burns/components/mobile_components/mobile_detail_classification_result.dart';
import 'package:frontend_burns/components/mobile_components/mobile_initial_treatment.dart';
import 'package:frontend_burns/global/burn_image.dart';
import 'package:frontend_burns/state/prediction_notifier.dart';

class MobileClassificationResult extends StatefulWidget {
  const MobileClassificationResult({super.key});

  @override
  State<MobileClassificationResult> createState() =>
      _ClassificationResultState();
}

class _ClassificationResultState extends State<MobileClassificationResult> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(10),
      decoration: BoxDecoration(
        border: BoxBorder.all(),
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.auto_graph_outlined, size: 32),
              const SizedBox.square(dimension: 20),
              Expanded(
                child: const Text(
                  "Hasil Klasifikasi",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox.square(dimension: 10),
          Container(
            padding: EdgeInsetsGeometry.all(10),
            decoration: BoxDecoration(
              border: BoxBorder.all(color: Colors.purple.shade700),
              borderRadius: BorderRadiusGeometry.circular(10),
              color: Colors.purple.shade50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Gambar Yang Diunggah",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox.square(dimension: 10),
                ValueListenableBuilder(
                  valueListenable: PredictionNotifier.isClassified,
                  builder: (context, value, child) {
                    return value
                        ? Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  child: Image.memory(
                                    BurnImage.selectedImage!,
                                    height: 300,
                                    width: 300,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: Icon(
                              Icons.image_outlined,
                              size: 200,
                              color: Colors.deepPurple,
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
          const SizedBox.square(dimension: 10),
          const MobileDetailClassificationResult(),
          const SizedBox.square(dimension: 10),
          const MobileInitialTreatment(),
        ],
      ),
    );
  }
}
