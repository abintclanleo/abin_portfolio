import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF2D2D44), // Slightly lighter background
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          Text(
            "Skills",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate().fade(duration: 500.ms).slideX(begin: -0.2, end: 0),
          const SizedBox(height: 40),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: const [
              _SkillChip(label: "Flutter", icon: FontAwesomeIcons.bolt), // No Flutter icon in generic FA
              _SkillChip(label: "Dart", icon: FontAwesomeIcons.code),
              _SkillChip(label: "Firebase", icon: FontAwesomeIcons.fire),
              _SkillChip(label: "REST API", icon: FontAwesomeIcons.server),
              _SkillChip(label: "Git", icon: FontAwesomeIcons.github),
              _SkillChip(label: "UI/UX Design", icon: FontAwesomeIcons.paintbrush),
              _SkillChip(label: "State Management", icon: FontAwesomeIcons.layerGroup),
              _SkillChip(label: "Web Development", icon: FontAwesomeIcons.chrome),
            ]
            .animate(interval: 100.ms)
            .fade(duration: 500.ms)
            .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;
  final IconData icon;

  const _SkillChip({required this.label, required this.icon});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E2C),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xFF6C63FF).withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, size: 20, color: const Color(0xFF03DAC6)),
            const SizedBox(width: 10),
            Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      )
      .animate(target: isHovering ? 1 : 0)
      .scale(end: const Offset(1.1, 1.1), duration: 200.ms)
      .elevation(end: 10, color: const Color(0xFF6C63FF).withOpacity(0.3)),
    );
  }
}
