import 'package:eye_comm_project/feature/screens/health_emergency/pain_location.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../widgets/custom_page.dart';
import '../../widgets/needs_button.dart';

class HealthEmergencyScreen extends StatelessWidget {
  const HealthEmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<NeedsButton> list = [
      NeedsButton(
        title: "Emergency - Call 911",
        icon: Icon(
          Icons.error_outline,
          color: AppColors.settingColor,
          size: 30,
        ),
        color: AppColors.backPrimaryColor,
      ),
      NeedsButton(
        title: "I need my medication",
        icon: Icon(Icons.medication, color: AppColors.secondaryColor, size: 30),
        color: AppColors.backSecondaryColor,
      ),
      NeedsButton(
        title: "I don't feel well",
        icon: Icon(Icons.thermostat, color: AppColors.tertiaryColor, size: 30),
        color: AppColors.backTertiaryColor,
      ),
      NeedsButton(
        title: "I have pain",
        page: PainLocation(),
        icon: Icon(
          Icons.location_on_outlined,
          color: AppColors.communicationColor,
          size: 30,
        ),
        color: AppColors.backCommunicationColor,
      ),
      NeedsButton(
        title: "Call my doctor",
        icon: Icon(Icons.call, color: AppColors.settingColor),
        color: AppColors.backSettingColor,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomPage(
        title: "Health & Emergency",
        description: "Get help immediately",
        color: AppColors.secondaryColor,
        list: list,
        backcolor: AppColors.backSecondaryColor,
      ),
    );
  }
}
