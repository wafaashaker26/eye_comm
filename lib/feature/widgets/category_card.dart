import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.numClass,
    required this.color,
    required this.icon,
    required this.page,
  });

  final String title;
  final String numClass;
  final Color color;
  final Icon icon;
  final Widget page;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isHovered = false;
  Timer? _hoverTimer;

  void _startHoverTimer(BuildContext context) {
    _hoverTimer = Timer(const Duration(milliseconds: 1500), () {
      if (mounted && isHovered) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => widget.page),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double iconSize = constraints.maxHeight * 0.2;
        final double titleFontSize = constraints.maxHeight * 0.1;
        final double subFontSize = constraints.maxHeight * 0.07;
        final double paddingSize = constraints.maxHeight * 0.065;

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            setState(() => isHovered = true);
            _startHoverTimer(context);
          },
          onExit: (_) {
            setState(() => isHovered = false);
            _hoverTimer?.cancel();
          },
          child: AnimatedScale(
            scale: isHovered ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.all(paddingSize),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(paddingSize * 0.5),
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      widget.icon.icon,
                      color: widget.icon.color,
                      size: iconSize,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  Text(
                    "Class ${widget.numClass}",
                    style: GoogleFonts.poppins(
                      fontSize: subFontSize,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
