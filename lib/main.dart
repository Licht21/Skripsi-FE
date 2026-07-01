import 'package:flutter/material.dart';
import 'package:frontend_burns/components/classification_result.dart';
import 'package:frontend_burns/components/detail_classification_result.dart';
import 'package:frontend_burns/components/initial_treatment.dart';
import 'package:frontend_burns/components/instruction_for_use.dart';
import 'package:frontend_burns/components/system_classification.dart';
import 'package:frontend_burns/components/system_information.dart';
import 'package:frontend_burns/components/tips_taking_pictures.dart';
import 'package:frontend_burns/mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klasifikasi Luka Bakar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xFFF5F6F9),
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: const Color(0xFF1E1E1E),
          displayColor: const Color(0xFF1E1E1E),
        ),
      ),
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 1700) {
            return const Scaffold(body: MobilePage());
          } else {
            return const HomePage();
          }
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  SystemClassification(),
                  const SizedBox.square(dimension: 20),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        InstructionForUse(),
                        const SizedBox.square(dimension: 20),
                        SystemInformation(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox.square(dimension: 20),
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      padding: EdgeInsetsGeometry.all(15),
                      child: Row(
                        children: [
                          ClassificationResult(),
                          const SizedBox.square(dimension: 20),
                          DetailClassificationResult(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 20),
                  InitialTreatment(),
                  const SizedBox.square(dimension: 20),
                  TipsTakingPictures(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
