import 'package:flutter/material.dart';
import '../../../core/colors.dart';
import '../../widgets/custom_inside_page.dart';
import '../../widgets/needs_button.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<NeedsButton> list = [
      NeedsButton(
        color: AppColors.backPrimaryColor,
        title: "Bread",
        icon: Icon(
          Icons.bakery_dining,
          color: AppColors.primaryColor,
          size: 30,
        ),
      ),
      NeedsButton(
        color: AppColors.backSecondaryColor,
        title: "Eggs",
        icon: Icon(
          Icons.egg_alt,
          color: AppColors.secondaryColor,
          size: 30,
        ),
      ),
      NeedsButton(
        title: "Fish",
        color: AppColors.backTertiaryColor,
        icon: Icon(
          Icons.set_meal, // أيقونة السمك/وجبة بحرية
          color: AppColors.tertiaryColor,
          size: 30,
        ),
      ),
      NeedsButton(
        title: "Chicken",
        color: AppColors.backCommunicationColor,
        icon: Icon(
          Icons.restaurant, // أيقونة للدجاج/وجبة بروتين
          color: AppColors.communicationColor,
          size: 30,
        ),
      ),
      NeedsButton(
        title: "Pasta",
        color: AppColors.backSettingColor,
        icon: Icon(
          Icons.dinner_dining, // أيقونة الباستا/الوجبات
          color: AppColors.settingColor,
          size: 30,
        ),
      ),
    ];


    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomInsidePage(
        title: "Foods",
        backTitle: 'Basic Needs',
        color: AppColors.primaryColor,
        list: list,
        backcolor: AppColors.backPrimaryColor,
        isExist: true,
        description: "I'm hungry",
      ),
    );
  }
}
