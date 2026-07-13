import 'package:flutter/material.dart';
import 'package:frontend_burns/state/prediction_notifier.dart';
import 'package:frontend_burns/state/result_notifier.dart';
import 'package:frontend_burns/utilities/predict.dart';

class MobileInitialTreatment extends StatefulWidget {
  const MobileInitialTreatment({super.key});

  @override
  State<MobileInitialTreatment> createState() => _InitialTreatmentState();
}

class _InitialTreatmentState extends State<MobileInitialTreatment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadiusGeometry.circular(10),
        color: Colors.orange.shade100,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Icon(
                  Icons.shield_outlined,
                  size: 36,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              const SizedBox.square(dimension: 10),
              Expanded(
                child: const Text(
                  "Saran Penanganan Awal",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox.square(dimension: 10),
          ValueListenableBuilder(
            valueListenable: PredictionNotifier.isClassified,
            builder: (ctx, value, _) {
              if (!value) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.health_and_safety_outlined,
                          size: 70,
                          color: Colors.deepOrange,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Belum Ada Rekomendasi',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Saran penanganan awal akan ditampilkan '
                          'berdasarkan hasil klasifikasi derajat luka bakar.',
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
              }

              final items = Predict.burnsEarlyHandling(
                ResultNotifier.degree.value!,
              );

              int counter = 0;
              // print(items);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...items.map((item) {
                    List<Widget> icon = item.keys.toList();
                    List<String> handling = item.values.toList()[0];

                    counter += 1;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          icon[0],
                          const SizedBox.square(dimension: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  handling[0],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(handling[1]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              );
            },
          ),
          // Expanded(child: Placeholder()),
        ],
      ),
    );
  }
}
