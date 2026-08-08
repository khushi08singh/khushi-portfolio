import 'package:flutter/material.dart';
import '../constants.dart';
import '../theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 20),
          const Text(
            AppConstants.about,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 18,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}