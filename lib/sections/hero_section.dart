import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception("Couldn't launch $url");
    }
  }
  Future<void> _openResume() async {
    final uri = Uri.parse('assets/resume/Khushi_Resume.pdf');

    await launchUrl(
      uri,
      mode: LaunchMode.platformDefault,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final isMobile = width < 900;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 80,
        vertical: 80,
      ),
      child: isMobile
          ? Column(
        children: [
          _photo(),
          const SizedBox(height: 40),
          _content(context),
        ],
      )
          : Row(
        children: [
          Expanded(
            flex: 6,
            child: _content(context),
          ),
          const SizedBox(width: 50),
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.center,
              child: _photo(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Hi, I'm",
          style: Theme.of(context)
              .textTheme
              .headlineMedium,
        ),

        const SizedBox(height: 10),

        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                AppTheme.primary,
                AppTheme.secondary,
              ],
            ).createShader(bounds);
          },
          child: Text(
            AppConstants.name,
            style: const TextStyle(
              fontSize: 70,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 20),

        Text(
          AppConstants.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          AppConstants.heroSubtitle,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 18,
            height: 1.8,
          ),
        ),

        const SizedBox(height: 40),

        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [

            ElevatedButton.icon(
              onPressed: _openResume,
              icon: const Icon(Icons.download),
              label: const Text("Resume"),
            ),

            OutlinedButton.icon(
              onPressed: () => _launch(AppConstants.github),
              icon: const FaIcon(FontAwesomeIcons.github),
              label: const Text("GitHub"),
            ),

            OutlinedButton.icon(
              onPressed: () => _launch(AppConstants.linkedin),
              icon: const FaIcon(FontAwesomeIcons.linkedin),
              label: const Text("LinkedIn"),
            ),

          ],
        )
      ],
    ).animate().fade(duration: 700.ms).slideX(begin: -.2);
  }

  Widget _photo() {
    return Container(
      width: 340,
      height: 340,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [
            AppTheme.primary,
            AppTheme.secondary,
          ],
        ),
        boxShadow: [
          BoxShadow(
            // color: AppTheme.primary.withOpacity(.4),
            color: AppTheme.primary.withValues(alpha: 0.4),
            blurRadius: 40,
          ),
        ],
      ),
      padding: const EdgeInsets.all(5),
      child: ClipOval(
        child: Image.asset(
          AppConstants.profileImage,
          fit: BoxFit.cover,
        ),
      ),
    ).animate().fade(duration: 800.ms).scale();
  }
}