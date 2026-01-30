import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../widgets/custom_inside_page.dart';
import '../../widgets/needs_button.dart';

class QuickPhrases extends StatelessWidget {
  const QuickPhrases({super.key});

  @override
  Widget build(BuildContext context) {
    List<NeedsButton> list = [
      NeedsButton(
        color: AppColors.backPrimaryColor,
        title: "Yes, please",
        icon: Icon(
          Icons.chat_bubble_outline_outlined,
          color: AppColors.primaryColor,
          size: 30,
        ),
      ),
      NeedsButton(
        color: AppColors.backSecondaryColor,
        title: "No, thank you",
        icon: Icon(
          Icons.chat_bubble_outline_outlined,
          color: AppColors.secondaryColor,
          size: 30,
        ),
      ),
      NeedsButton(
        title: "Maybe later",
        color: AppColors.backTertiaryColor,
        icon: Icon(
          Icons.chat_bubble_outline_outlined,
          color: AppColors.tertiaryColor,
          size: 30,
        ),
      ),
      NeedsButton(
        title: "I need help",
        color: AppColors.backCommunicationColor,
        icon: Icon(
          Icons.chat_bubble_outline_outlined,
          color: AppColors.communicationColor,
          size: 30,
        ),
      ),
      NeedsButton(
        title: "Thank you",
        color: AppColors.backSettingColor,
        icon: Icon(
          Icons.chat_bubble_outline_outlined,
          color: AppColors.settingColor,
          size: 30,
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomInsidePage(
        title: "Quick Phrases",
        backTitle: 'Emotions & Talk',
        color: AppColors.primaryColor,
        list: list,
        backcolor: AppColors.backPrimaryColor,
        isExist: true,
        description: 'Quick Phrases',
      ),
    );
  }
}
