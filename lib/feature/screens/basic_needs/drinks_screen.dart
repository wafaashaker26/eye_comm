import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../widgets/custom_inside_page.dart';
import '../../widgets/needs_button.dart';

class DrinksScreen extends StatelessWidget {
  const DrinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<NeedsButton> list = [
      NeedsButton(
        color: AppColors.backPrimaryColor,
        title: "Water",
        icon: Icon(
          Icons.local_drink,
          color: AppColors.primaryColor,
          size: 30,
        ),
      ),
      NeedsButton(
        color: AppColors.backSecondaryColor,
        title: "Milk",
        icon: Icon(
          Icons.emoji_food_beverage,
          color: AppColors.secondaryColor,
          size: 30,
        ),
      ),
      NeedsButton(
        title: "Juice",
        color: AppColors.backTertiaryColor,
        icon: Icon(
          Icons.ramen_dining,
          color: AppColors.tertiaryColor,
          size: 30,
        ),
      ),
      NeedsButton(
        title: "Tea",
        color: AppColors.backCommunicationColor,
        icon: Icon(
          Icons.local_cafe,
          color: AppColors.communicationColor,
          size: 30,
        ),
      ),
      NeedsButton(
        title: "Coffee",
        color: AppColors.backSettingColor,
        icon: Icon(
          Icons.coffee,
          color: AppColors.settingColor,
          size: 30,
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomInsidePage(
        title: "Drinks",
        backTitle: 'Basic Needs',
        color: AppColors.primaryColor,
        list: list,
        backcolor: AppColors.backPrimaryColor,
        isExist: true,
        description: "I'm thirty",
      ),
    );
  }
}
