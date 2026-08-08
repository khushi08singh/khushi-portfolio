import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _launch(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  Widget projectCard({
    required String title,
    required String description,
    required List<String> tech,
    required String github,
  }) {
    return Container(
      width: 520,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tech
                .map(
                  (e) => Chip(
                label: Text(e),
                backgroundColor: AppTheme.background,
                labelStyle: const TextStyle(color: Colors.white),
              ),
            )
                .toList(),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () => _launch(github),
            child: const Text('View on GitHub'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Projects',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              projectCard(
                title: 'Moms Magic',
                description:
                'Flutter food delivery application with responsive UI, cart functionality, Provider state management, and clean navigation architecture.',
                tech: ['Flutter', 'Dart', 'Provider', 'Material 3'],
                github: 'https://github.com/khushi08singh/Moms_Magic',
              ),
              projectCard(
                title: 'Interview Quest AI',
                description:
                'AI-powered interview preparation application with modular Flutter architecture, responsive UI, and continuous Git-based development.',
                tech: ['Flutter', 'Dart', 'Provider', 'AI Integration'],
                github: 'https://github.com/khushi08singh/Interview-Quest-AI',
              ),
            ],
          ),
        ],
      ),
    );
  }
}