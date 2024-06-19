import 'package:flutter/material.dart';
import 'package:watchez/utils/app_colors.dart';
import 'package:watchez/utils/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                "What do you want to watch?",
                style: AppStyles.h2,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: AppStyles.textFieldStyle,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
