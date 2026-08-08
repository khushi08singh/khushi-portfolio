
import 'package:flutter/material.dart';
import '../constants.dart';
import '../theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.red,
    //   height: 200,
    //   child: const Center(
    //     child: Text(
    //       'SKILLS SECTION',
    //       style: TextStyle(color: Colors.white, fontSize: 30),
    //     ),
    //   ),
    // );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: AppConstants.skills
                .map(
                  (skill) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppTheme.primary),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}