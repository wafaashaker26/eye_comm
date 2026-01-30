import 'package:eye_comm_project/feature/screens/emotions_talk/quick_phrases.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../widgets/custom_page.dart';
import '../../widgets/needs_button.dart';

class EmotionsTalkScreen extends StatelessWidget {
  const EmotionsTalkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<NeedsButton> list = [
      NeedsButton(
        title: "I'm happy",
        icon: Icon(Icons.sentiment_satisfied_alt, color: AppColors.primaryColor,size: 30,), color: AppColors.backPrimaryColor,
      ),
      NeedsButton(
        title: "I'm sad",
        color: AppColors.backSecondaryColor,
        icon: Icon(Icons.sentiment_dissatisfied_outlined, color: AppColors.secondaryColor,size: 30,),
      ),
      NeedsButton(
        title: "I love you",
        color: AppColors.backTertiaryColor,
        icon: Icon(Icons.favorite_border, color: AppColors.tertiaryColor,size: 30,),
      ),
      NeedsButton(
        title: "I'm frustrated",
        color: AppColors.backCommunicationColor,
        icon: Icon(Icons.energy_savings_leaf_outlined, color: AppColors.communicationColor,size: 30,),
      ),
      NeedsButton(
        title: "Quick phrases",
        color: AppColors.backSettingColor,
        page: QuickPhrases(),
        icon: Icon(Icons.chat_bubble_outline, color: AppColors.settingColor,size: 30,),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomPage(
        title: "Basic Needs",
        description: "Choose What need",
        color: AppColors.primaryColor,
        list: list, backcolor: AppColors.backPrimaryColor,
      ),
    );
  }
}
