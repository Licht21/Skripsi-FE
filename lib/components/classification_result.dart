import 'package:flutter/material.dart';
import 'package:frontend_burns/state/prediction_notifier.dart';

import '../global/burn_image.dart';

class ClassificationResult extends StatefulWidget {
  const ClassificationResult({super.key});

  @override
  State<ClassificationResult> createState() => _ClassificationResultState();
}

class _ClassificationResultState extends State<ClassificationResult> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          Expanded(
            child: Row(
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
          ),
          const SizedBox.square(dimension: 10),
          Expanded(
            flex: 9,
            child: Container(
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
                  Expanded(
                    flex: 9,
                    child: ValueListenableBuilder(
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
                            : Expanded(
                                child: Center(
                                  child: Icon(
                                    Icons.image_outlined,
                                    size: 200,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
