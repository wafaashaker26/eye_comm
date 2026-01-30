import 'package:flutter/material.dart';
import '../../widgets/custom_page.dart';
import '../../widgets/needs_button.dart';
import '/../core/colors.dart';

class SmartHomeScreen extends StatelessWidget {
  const SmartHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<NeedsButton> list = [
      NeedsButton(
        title: "Turn on/off lights",
        color: AppColors.backPrimaryColor,
        icon: Icon(Icons.lightbulb_outline_rounded, color: AppColors.primaryColor,size: 30,),
      ),
      NeedsButton(
        title: "Control TV",
        color: AppColors.backSecondaryColor,
        icon: Icon(Icons.live_tv, color: AppColors.secondaryColor,size: 30,),
      ),
      NeedsButton(
        title: "Adjust temperature",
        color: AppColors.backTertiaryColor,
        icon: Icon(Icons.mode_fan_off, color: AppColors.tertiaryColor,size: 30,),
      ),
      NeedsButton(
        title: "Open/close door",
        color: AppColors.backCommunicationColor,
        icon: Icon(Icons.sensor_door_outlined, color: AppColors.communicationColor,size: 30,),
      ),
      NeedsButton(
        title: "Adjust volume",
        color: AppColors.backSettingColor,
        icon: Icon(Icons.volume_up_outlined, color: AppColors.settingColor,size: 30,),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomPage(
        title: "Smart Home",
        description: "Control Home",
        color: AppColors.tertiaryColor,
        list: list, backcolor: AppColors.backTertiaryColor,
      ),
    );
  }
}
