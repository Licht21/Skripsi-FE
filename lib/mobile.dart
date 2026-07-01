import 'package:flutter/material.dart';
import 'package:frontend_burns/components/classification_result.dart';
import 'package:frontend_burns/components/detail_classification_result.dart';
import 'package:frontend_burns/components/initial_treatment.dart';
import 'package:frontend_burns/components/instruction_for_use.dart';
import 'package:frontend_burns/components/mobile_components/mobile_classification_result.dart';
import 'package:frontend_burns/components/mobile_components/mobile_image_upload_section.dart';
import 'package:frontend_burns/components/mobile_components/mobile_system_classification.dart';
import 'package:frontend_burns/components/mobile_components/mobile_tips_taking_pictures.dart';
import 'package:frontend_burns/components/system_classification.dart';
import 'package:frontend_burns/components/system_information.dart';
import 'package:frontend_burns/components/tips_taking_pictures.dart';

class MobilePage extends StatelessWidget {
  const MobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              MobileSystemClassification(),
              const SizedBox.square(dimension: 10),
              MobileImageUploadSection(),
              const SizedBox.square(dimension: 10),
              MobileClassificationResult(),
              const SizedBox.square(dimension: 10),
              MobileTipsTakingPictures(),
            ],
          ),
        ),
      ),
    );
  }
}
