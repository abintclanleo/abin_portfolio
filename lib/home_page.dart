import 'package:flutter/material.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Abin T.', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          _NavBarItem(title: 'About', onTap: () => _scrollToSection(_aboutKey)),
          _NavBarItem(title: 'Skills', onTap: () => _scrollToSection(_skillsKey)),
          _NavBarItem(title: 'Projects', onTap: () => _scrollToSection(_projectsKey)),
          _NavBarItem(title: 'Contact', onTap: () => _scrollToSection(_contactKey)),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            AboutSection(key: _aboutKey),
            SkillsSection(key: _skillsKey),
            ProjectsSection(key: _projectsKey),
            ContactSection(key: _contactKey),
            const SizedBox(height: 50),
            const Text(
              "© 2025 Abin T. Built with Flutter Web.",
              style: TextStyle(color: Colors.white54),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
