import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF6C63FF),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          const Text(
            "Let's Work Together",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ).animate().fade(duration: 500.ms).slideY(begin: 0.3, end: 0),
          const SizedBox(height: 20),
          const Text(
                "Have a project in mind or want to hire me? Feel free to reach out!",
                style: TextStyle(fontSize: 18, color: Colors.white70),
                textAlign: TextAlign.center,
              )
              .animate(delay: 200.ms)
              .fade(duration: 500.ms)
              .slideY(begin: 0.3, end: 0),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children:
                  const [
                        _ContactButton(
                          icon: Icons.email,
                          label: "Email Me",
                          url: "mailto:abin.work333@gmail.com",
                        ),
                        _ContactButton(
                          icon: FontAwesomeIcons.linkedin,
                          label: "LinkedIn",
                          url: "https://www.linkedin.com/in/abhin-t-b38ab7261",
                          // No delay for first item if we want them to appear together, or staggered
                        ),
                        _ContactButton(
                          icon: FontAwesomeIcons.github,
                          label: "GitHub",
                          url: "https://github.com/abintclanleo",
                        ),
                      ]
                      .animate(interval: 100.ms, delay: 400.ms)
                      .fade(duration: 500.ms)
                      .slideY(begin: 0.3, end: 0),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;

  const _ContactButton({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool isHovering = false;

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(widget.url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch \$uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child:
          ElevatedButton.icon(
                onPressed: _launchURL,
                icon: Icon(widget.icon, size: 20),
                label: Text(widget.label),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF6C63FF),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
              .animate(target: isHovering ? 1 : 0)
              .scale(end: const Offset(1.1, 1.1), duration: 200.ms)
              .tint(color: const Color(0xFF6C63FF).withOpacity(0.1)),
    );
  }
}
