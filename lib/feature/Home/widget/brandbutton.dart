import 'package:flutter/material.dart';

class BrandButtons extends StatelessWidget {
  const BrandButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const gap = 8.0;
        const buttonHeight = 44.0;
        const arrowWidth = 95.0;
        final width = constraints.maxWidth;
        final contentWidth = width - 24;
        final rowWidth = (contentWidth - gap * 2) / 3;

        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: arrowWidth,
                    height: 36,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            'assets/Glossy Orange-Gold Arrow Button 1.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Powered By',
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                shadows: [
                                  Shadow(
                                    color: Color(0xFF8A3900),
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: gap),
                  Expanded(
                    child: _GoldBrandButton(
                      text: 'Elephant',
                      height: buttonHeight,
                      fontSize: 18,
                      onTap: () => debugPrint('Elephant tapped'),
                    ),
                  ),
                  const SizedBox(width: gap),
                  Expanded(
                    child: _GoldBrandButton(
                      text: 'FOLO',
                      height: buttonHeight,
                      fontSize: 18,
                      onTap: () => debugPrint('FOLO tapped'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(
                    width: rowWidth,
                    child: _GoldBrandButton(
                      text: 'KPL',
                      height: buttonHeight,
                      fontSize: 18,
                      onTap: () => debugPrint('KPL tapped'),
                    ),
                  ),
                  const SizedBox(width: gap),
                  SizedBox(
                    width: rowWidth,
                    child: _GoldBrandButton(
                      text: 'Potron',
                      height: buttonHeight,
                      fontSize: 18,
                      onTap: () => debugPrint('Potron tapped'),
                    ),
                  ),
                  const SizedBox(width: gap),
                  SizedBox(
                    width: rowWidth,
                    child: _GoldBrandButton(
                      text: 'Quiter',
                      height: buttonHeight,
                      fontSize: 18,
                      onTap: () => debugPrint('Quiter tapped'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GoldBrandButton extends StatelessWidget {
  final String text;
  final double height;
  final double fontSize;
  final VoidCallback onTap;

  const _GoldBrandButton({
    required this.text,
    required this.height,
    required this.fontSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: height,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFFF4AD),
                Color(0xFFFFC107),
                Color(0xFFD58A00),
                Color(0xFFFFE082),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFB300).withValues(alpha: 0.16),
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color(0xFFFFFEFA), Color(0xFFF4EBDD)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w900,
                    letterSpacing: text == 'FOLO' ? 2 : 0,
                    color: const Color(0xFF17130D),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
