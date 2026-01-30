import 'dart:async';
import 'package:battery_plus/battery_plus.dart';
import 'package:eye_comm_project/feature/screens/smart_home/smart_home_screen.dart';
import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/helper/home_helper.dart';
import '../widgets/category_card.dart';
import 'basic_needs/basic_needs_screen.dart';
import 'emotions_talk/emotions_talk_screen.dart';
import 'health_emergency/health_emergency_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Battery _battery = Battery();
  int _batteryLevel = 100;
  DateTime _time = DateTime.now();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = startTimeUpdater(() {
      if (mounted) setState(() => _time = DateTime.now());
    });
    Timer.periodic(const Duration(seconds: 30), (timer) async {
      final level = await _battery.batteryLevel;
      if (mounted) setState(() => _batteryLevel = level);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            // ================= HEADER =================
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              color: Colors.white,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hello Alex",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        formatTime(_time),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const CircleAvatar(radius: 5, backgroundColor: Colors.green),
                      const SizedBox(width: 6),
                      Text(
                        "$_batteryLevel%",
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ================= BODY =================
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CategoryCard(
                              title: "Basic Needs",
                              numClass: "0",
                              color: AppColors.backPrimaryColor,
                              icon: Icon(Icons.food_bank_outlined,
                                  color: AppColors.primaryColor, size: 24),
                              page: const BasicNeedsScreen(),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: CategoryCard(
                              title: "Health & Emergency",
                              numClass: "1",
                              color: AppColors.backSecondaryColor,
                              icon: Icon(Icons.favorite_border,
                                  color: AppColors.secondaryColor, size: 24),
                              page: const HealthEmergencyScreen(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CategoryCard(
                              title: "Smart Home",
                              numClass: "2",
                              color: AppColors.backTertiaryColor,
                              icon: Icon(Icons.home_outlined,
                                  color: AppColors.tertiaryColor, size: 26),
                              page: const SmartHomeScreen(),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: CategoryCard(
                              title: "Emotions & Talk",
                              numClass: "3",
                              color: AppColors.backCommunicationColor,
                              icon: Icon(Icons.chat_bubble_outline,
                                  color: AppColors.communicationColor, size: 25),
                              page: const EmotionsTalkScreen(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
