import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';
import '../theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launch(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Column(
        children: [
          Text(
            'Contact',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          const Text(
            'Open to Flutter Developer and Mobile App Developer opportunities.',
            style: TextStyle(color: AppTheme.textSecondary, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SelectableText(
            AppConstants.email,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            children: [
              ElevatedButton(
                onPressed: () => _launch(AppConstants.github),
                child: const Text('GitHub'),
              ),
              ElevatedButton(
                onPressed: () => _launch(AppConstants.linkedin),
                child: const Text('LinkedIn'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}