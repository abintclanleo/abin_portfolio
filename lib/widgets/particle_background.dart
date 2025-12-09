import 'dart:math';
import 'package:flutter/material.dart';

class ParticleBackground extends StatefulWidget {
  final int numberOfParticles;
  final Color particleColor;

  const ParticleBackground({
    super.key,
    this.numberOfParticles = 50,
    this.particleColor = Colors.white,
  });

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Particle> particles = [];
  final Random _random = Random();
  Offset? _mousePosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (particles.isEmpty) {
      final size = MediaQuery.of(context).size;
      for (int i = 0; i < widget.numberOfParticles; i++) {
        particles.add(
          Particle(
            position: Offset(
              _random.nextDouble() * size.width,
              _random.nextDouble() * size.height,
            ),
            velocity: Offset(
              (_random.nextDouble() - 0.5) * 0.5,
              (_random.nextDouble() - 0.5) * 0.5,
            ),
            size: _random.nextDouble() * 3 + 1,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _mousePosition = event.localPosition;
        });
      },
      onExit: (event) {
        setState(() {
          _mousePosition = null;
        });
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          _updateParticles();
          return CustomPaint(
            painter: ParticlePainter(
              particles: particles,
              particleColor: widget.particleColor,
              mousePosition: _mousePosition,
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }

  void _updateParticles() {
    final size = MediaQuery.of(context).size;
    for (var particle in particles) {
      particle.position += particle.velocity;

      // Bounce off walls
      if (particle.position.dx < 0 || particle.position.dx > size.width) {
        particle.velocity = Offset(-particle.velocity.dx, particle.velocity.dy);
      }
      if (particle.position.dy < 0 || particle.position.dy > size.height) {
        particle.velocity = Offset(particle.velocity.dx, -particle.velocity.dy);
      }
    }
  }
}

class Particle {
  Offset position;
  Offset velocity;
  double size;

  Particle({
    required this.position,
    required this.velocity,
    required this.size,
  });
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final Color particleColor;
  final Offset? mousePosition;

  ParticlePainter({
    required this.particles,
    required this.particleColor,
    this.mousePosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = particleColor.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = particleColor.withOpacity(0.1)
      ..strokeWidth = 1;

    for (int i = 0; i < particles.length; i++) {
      final p1 = particles[i];
      canvas.drawCircle(p1.position, p1.size, paint);

      // Connect to mouse
      if (mousePosition != null) {
        final distToMouse = (p1.position - mousePosition!).distance;
        if (distToMouse < 150) {
          canvas.drawLine(
            p1.position,
            mousePosition!,
            linePaint..color = particleColor.withOpacity(1 - distToMouse / 150),
          );
        }
      }

      // Connect to other particles
      for (int j = i + 1; j < particles.length; j++) {
        final p2 = particles[j];
        final dist = (p1.position - p2.position).distance;

        if (dist < 100) {
          canvas.drawLine(
            p1.position,
            p2.position,
            linePaint
              ..color = particleColor.withOpacity((1 - dist / 100) * 0.5),
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
