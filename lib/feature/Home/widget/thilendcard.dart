import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class ThailandPromoCard extends StatelessWidget {
  final double? height;

  const ThailandPromoCard({super.key, this.height = 180});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final bool isSmall = width < 350;
        final bool isCompact = width < 430;

        final double horizontalPadding = isSmall ? 10 : 16;

        final double titleSize = isSmall
            ? 12
            : isCompact
            ? 14
            : 16;

        final double subtitleSize = isSmall
            ? 13
            : isCompact
            ? 15
            : 17;

        final double imageHeight = (width * 0.34).clamp(95.0, 155.0);

        return Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.gold, width: 3.5),
            boxShadow: [
              BoxShadow(
                color: AppColors.maroon.withValues(alpha: 0.15),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LayoutBuilder(
              builder: (context, cardConstraints) {
                final double cardWidth = cardConstraints.maxWidth;

                if (cardWidth < 280) {
                  return _buildVerticalLayout(
                    context: context,
                    padding: horizontalPadding,
                    titleSize: titleSize,
                    subtitleSize: subtitleSize,
                    imageHeight: imageHeight,
                  );
                }

                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: _buildTextContent(
                          context: context,
                          titleSize: titleSize,
                          subtitleSize: subtitleSize,
                          isSmall: isSmall,
                          isCompact: isCompact,
                        ),
                      ),
                      SizedBox(width: isSmall ? 2 : 6),
                      Expanded(
                        flex: 5,
                        child: Image.asset(
                          'assets/Thai Silk Elegance with Tropical Blooms 1.png',
                          fit: BoxFit.contain,
                          height: imageHeight,
                          errorBuilder: (_, _, _) => const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextContent({
    required BuildContext context,
    required double titleSize,
    required double subtitleSize,
    required bool isSmall,
    required bool isCompact,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Popular from',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.playfairDisplay(
            fontSize: titleSize,
            fontWeight: FontWeight.w600,
            color: AppColors.darkText,
          ),
        ),
        const SizedBox(height: 3),
        Image.asset(
          'assets/Thailand.png',
          height: isSmall ? 26 : 32,
          fit: BoxFit.contain,
          errorBuilder: (_, _, _) => const SizedBox.shrink(),
        ),
        const SizedBox(height: 3),
        Text(
          'Best brands at best prices',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.caveat(
            fontSize: subtitleSize,
            fontWeight: FontWeight.w600,
            color: AppColors.darkText,
          ),
        ),
        SizedBox(height: isSmall ? 6 : 10),
        _buildExploreButton(context),
      ],
    );
  }

  Widget _buildExploreButton(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final double fontSize = (screenWidth * 0.03).clamp(9.0, 14.0);

    final double iconSize = (screenWidth * 0.035).clamp(11.0, 16.0);

    final double horizontalPadding = (screenWidth * 0.025).clamp(8.0, 14.0);

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.exploreBlue,
        foregroundColor: Colors.white,
        elevation: 0,

        // Increased button height.
        minimumSize: const Size(0, 36),

        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 8,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.standard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Explore Now',
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          Icon(Icons.arrow_forward, size: iconSize),
        ],
      ),
    );
  }

  Widget _buildVerticalLayout({
    required BuildContext context,
    required double padding,
    required double titleSize,
    required double subtitleSize,
    required double imageHeight,
  }) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextContent(
              context: context,
              titleSize: titleSize,
              subtitleSize: subtitleSize,
              isSmall: true,
              isCompact: true,
            ),
            const SizedBox(height: 8),
            Center(
              child: Image.asset(
                'assets/Thai Silk Elegance with Tropical Blooms 1.png',
                height: imageHeight,
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) => const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
