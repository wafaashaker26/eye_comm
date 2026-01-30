import 'package:flutter/material.dart';
import '../../../core/colors.dart';
import '../../widgets/custom_page.dart';
import '../../widgets/needs_button.dart';
import 'drinks_screen.dart';
import 'food_screen.dart';

class BasicNeedsScreen extends StatelessWidget {
  const BasicNeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<NeedsButton> list = [
      NeedsButton(
        title: "I'm hungry",
        page:FoodScreen(),
        color: AppColors.backPrimaryColor,
        icon: Icon(Icons.food_bank_outlined, color: AppColors.primaryColor,size: 30),
      ),
      NeedsButton(
        title: "I'm thirsty",
        page: DrinksScreen(),
        color: AppColors.backSecondaryColor,
        icon: Icon(Icons.water_drop_outlined, color: AppColors.secondaryColor,size: 30,),
      ),
      NeedsButton(
        title: "I'm tired",
        color: AppColors.backTertiaryColor,
        icon: Icon(Icons.brightness_2_outlined, color: AppColors.tertiaryColor,size: 30,),
      ),
      NeedsButton(
        title: "I'm too hot/cold",
        color: AppColors.backCommunicationColor,
        icon: Icon(Icons.thermostat, color: AppColors.communicationColor,size: 30,),
      ),
      NeedsButton(
        title: "I need a break",
        color: AppColors.backSettingColor,
        icon: Icon(Icons.coffee, color: AppColors.settingColor,size: 30,),
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
