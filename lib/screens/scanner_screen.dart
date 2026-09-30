import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ScannerScreen extends StatelessWidget {
  final VoidCallback onClose;

  const ScannerScreen({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Dark background (replaces missing asset)
          const Positioned.fill(child: ColoredBox(color: Color(0xFF1A1C1B))),

          // Radial gradient overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.5),
                  ],
                  radius: 1.2,
                ),
              ),
            ),
          ),

          // Top App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.marginMobile,
                vertical: 16.0,
              ).copyWith(top: MediaQuery.of(context).padding.top + 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.6),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconButton(Icons.arrow_back, onClose),
                  const Column(
                    children: [
                      Text(
                        'SMART GROCERY',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'AI SCANNING ACTIVE',
                        style: TextStyle(
                          color: Color(0xFFA7D7C5),
                          fontSize: 10,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  _buildIconButton(Icons.flash_on, () {}),
                ],
              ),
            ),
          ),

          // Side Tool Bar
          Positioned(
            top: 120,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.4),
                borderRadius: AppRadius.xl,
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: Column(
                children: [
                  _buildToolButton(
                    Icons.auto_awesome,
                    true,
                    colorScheme,
                    () {},
                  ),
                  const SizedBox(height: 16),
                  _buildToolButton(Icons.zoom_in, false, colorScheme, () {}),
                  const SizedBox(height: 16),
                  _buildToolButton(Icons.exposure, false, colorScheme, () {}),
                ],
              ),
            ),
          ),

          // Central Viewfinder
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 400,
              margin: const EdgeInsets.only(bottom: 60),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: ViewfinderPainter(
                        cornerColor: colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            colorScheme.primaryContainer,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    right: 20,
                    child: DetectedItemTag(
                      text: 'Organic Milk • \$5.99',
                      dotOnRight: true,
                      primaryColor: colorScheme.primary,
                      primaryContainer: colorScheme.primaryContainer,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 40,
                    child: DetectedItemTag(
                      text: 'Avocados (3pk) • \$4.50',
                      dotOnRight: false,
                      primaryColor: colorScheme.primary,
                      primaryContainer: colorScheme.primaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Panel
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.lg,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.8),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TOTAL DETECTED',
                            style: TextStyle(
                              color: colorScheme.primaryContainer.withValues(
                                alpha: 0.8,
                              ),
                              fontSize: 12,
                            ),
                          ),
                          const Text(
                            '\$10.49',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 4,
                            width: 32,
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.base),
                          Container(
                            height: 4,
                            width: 16,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.base),
                          Container(
                            height: 4,
                            width: 16,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildBottomIconButton(Icons.image, () {}),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorScheme.primaryContainer.withValues(
                                  alpha: 0.3,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorScheme.primaryContainer
                                        .withValues(alpha: 0.3),
                                    blurRadius: 24,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 80,
                              height: 80,
                              padding: const EdgeInsets.all(AppSpacing.xs),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 4,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildBottomIconButton(Icons.history, () {}),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.marginMobile),
                  Text(
                    'Align receipt within the frame',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: 0.1),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  static Widget _buildToolButton(
    IconData icon,
    bool isActive,
    ColorScheme colorScheme,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      borderRadius: AppRadius.md,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: AppRadius.md,
          color: isActive ? colorScheme.primaryContainer : Colors.transparent,
        ),
        child: Icon(icon, color: isActive ? Colors.black : Colors.white),
      ),
    );
  }

  static Widget _buildBottomIconButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: AppRadius.lg,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: AppRadius.lg,
          color: Colors.white.withValues(alpha: 0.1),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

class DetectedItemTag extends StatelessWidget {
  final String text;
  final bool dotOnRight;
  final Color primaryColor;
  final Color primaryContainer;

  const DetectedItemTag({
    super.key,
    required this.text,
    required this.dotOnRight,
    required this.primaryColor,
    required this.primaryContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!dotOnRight) _buildDot(),
        if (!dotOnRight) const SizedBox(width: AppSpacing.base),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: primaryColor.withValues(alpha: 0.8),
            borderRadius: AppRadius.standard,
            border: Border.all(color: primaryContainer.withValues(alpha: 0.3)),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        if (dotOnRight) const SizedBox(width: AppSpacing.base),
        if (dotOnRight) _buildDot(),
      ],
    );
  }

  Widget _buildDot() {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: primaryColor,
        shape: BoxShape.circle,
        border: Border.all(color: primaryContainer, width: 2),
      ),
    );
  }
}

class ViewfinderPainter extends CustomPainter {
  final Color cornerColor;

  const ViewfinderPainter({required this.cornerColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = cornerColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    const double len = 32.0;

    canvas.drawLine(const Offset(0, 0), const Offset(len, 0), paint);
    canvas.drawLine(const Offset(0, 0), const Offset(0, len), paint);

    canvas.drawLine(Offset(size.width, 0), Offset(size.width - len, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, len), paint);

    canvas.drawLine(Offset(0, size.height), Offset(len, size.height), paint);
    canvas.drawLine(
      Offset(0, size.height),
      Offset(0, size.height - len),
      paint,
    );

    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width - len, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width, size.height - len),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant ViewfinderPainter oldDelegate) =>
      oldDelegate.cornerColor != cornerColor;
}
