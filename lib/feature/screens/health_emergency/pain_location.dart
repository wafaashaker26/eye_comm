import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../widgets/custom_inside_page.dart';
import '../../widgets/needs_button.dart';

class PainLocation extends StatelessWidget {
  const PainLocation({super.key});

  @override
  Widget build(BuildContext context) {
    List<NeedsButton> list = [
      NeedsButton(
        title: "My head hurts",
        color: AppColors.backPrimaryColor,
        icon: Icon(Icons.location_on_outlined, color: AppColors.primaryColor,size: 30,),
      ),

      NeedsButton(
        title: "My chest hurts",
        color: AppColors.backTertiaryColor,
        icon: Icon(Icons.location_on_outlined, color: AppColors.tertiaryColor,size: 30,),
      ),
      NeedsButton(
        title: "My stomach hurts",
        color: AppColors.backCommunicationColor,
        icon: Icon(Icons.location_on_outlined, color: AppColors.communicationColor,size: 30,),
      ),
      NeedsButton(
        title: "My back hurts",
        color: AppColors.backSettingColor,
        icon: Icon(Icons.location_on_outlined, color: AppColors.settingColor,size: 30,),
      ),
      NeedsButton(
        color: AppColors.backSecondaryColor,
        title: "My legs hurts",
        icon: Icon(Icons.location_on_outlined, color: AppColors.secondaryColor,size: 30,),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomInsidePage(
        title: "Pain Location",
        backTitle: 'health',
        color: AppColors.primaryColor,
        list: list, backcolor: AppColors.backPrimaryColor, isExist: false, description: 'Where does it hurt?',
      ),
    );
  }
}
