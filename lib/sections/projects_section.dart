import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          Text(
            "Featured Projects",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate().fade(duration: 500.ms).slideX(begin: -0.2, end: 0),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: const [
              _ProjectCard(
                title: "ReachOut",
                description:
                    "A contact Sharing App works with digitalised business cards, including features like scanning physical cards, chating, connection building, qr scanning, AI card creation etc.",
                techStack: ["Flutter", "Firebase", "AWS", "GetX", "Gemini AI"],
              ),
              _ProjectCard(
                title: "LEO Rigging Calculator",
                description:
                    "A calculator App used in the rigging field includes various calculations, Broadcast, AI Assistance",
                techStack: ["Flutter", "AWS", "GetX", "Open AI", "Razorpay"],
              ),
              _ProjectCard(
                title: "BuyIt",
                description:
                    "An E-commerce App with AI assistance, it helps users to buy things seemlessly.",
                techStack: ["Flutter", "REST API", "GetX"],
              ),
            ].animate(interval: 200.ms).fade(duration: 600.ms).slideY(begin: 0.2, end: 0),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> techStack;
  final String? link;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.techStack,
    this.link,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovering = false;

  Future<void> _launchURL() async {
    if (widget.link != null) {
      final Uri url = Uri.parse(widget.link!);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch \$url');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child:
          Container(
                width: 350,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: const Color(0xFF2D2D44),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6C63FF),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      widget.description,
                      style: const TextStyle(
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.techStack
                          .map(
                            (tech) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E1E2C),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                tech,
                                style: const TextStyle(
                                  color: Color(0xFF03DAC6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 25),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: _launchURL,
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "View Project",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .animate(target: isHovering ? 1 : 0)
              .scale(end: const Offset(1.03, 1.03), duration: 200.ms)
              .elevation(end: 15, color: Colors.black.withOpacity(0.3))
              .slideY(end: -0.02, duration: 200.ms),
    );
  }
}
