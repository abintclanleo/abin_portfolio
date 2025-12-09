import 'package:flutter/material.dart';
import 'package:abin_portfolio/widgets/particle_background.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:ui' as dart_ui;

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // Remove padding from container to let particles fill space, apply to column instead if needed
      // But here we want particles to cover the whole section background
      child: Stack(
        children: [
          const Positioned.fill(
            child: ParticleBackground(
              numberOfParticles: 40,
              particleColor: Colors.white,
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundColor: Color(0xFF6C63FF),
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ).animate().fade(duration: 600.ms).scale(delay: 200.ms),
                  const SizedBox(height: 30),
                  Text(
                        "Hi, I'm Abin T",
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                        textAlign: TextAlign.center,
                      )
                      .animate(delay: 400.ms)
                      .fade(duration: 500.ms)
                      .slideY(begin: -0.2, end: 0),
                  const SizedBox(height: 10),
                  Text(
                        "Flutter Developer",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: const Color(0xFF03DAC6),
                              fontWeight: FontWeight.w500,
                            ),
                        textAlign: TextAlign.center,
                      )
                      .animate(delay: 600.ms)
                      .fade(duration: 500.ms)
                      .slideY(begin: -0.2, end: 0),
                  const SizedBox(height: 30),
                  Container(
                        constraints: const BoxConstraints(maxWidth: 700),
                        child: Text(
                          "I build beautiful, responsive, and high-performance applications using Flutter. "
                          "Passionate about creating seamless user experiences and clean code. "
                          "From mobile to web, I bring ideas to life with Dart and Flutter.",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                height: 1.6,
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      )
                      .animate(delay: 800.ms)
                      .fade(duration: 500.ms)
                      .slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 40),
                  ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: BackdropFilter(
                          filter: dart_ui.ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                // Scroll to contact or open email
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 20,
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: const Text("Get in Touch"),
                            ),
                          ),
                        ),
                      )
                      .animate(delay: 1000.ms)
                      .fade(duration: 500.ms)
                      .slideY(begin: 0.2, end: 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
