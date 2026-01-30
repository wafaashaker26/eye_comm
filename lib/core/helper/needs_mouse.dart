import 'dart:async';
import 'package:flutter/material.dart';

class NeedsMouseWrapper extends StatefulWidget {
  const NeedsMouseWrapper({
    super.key,
    required this.child,
    required this.onHoverStart,
    required this.onHoverEnd,
    this.onNavigate,
  });

  final Widget child;
  final VoidCallback onHoverStart;
  final VoidCallback onHoverEnd;
  final VoidCallback? onNavigate;

  @override
  State<NeedsMouseWrapper> createState() => _NeedsMouseWrapperState();
}

class _NeedsMouseWrapperState extends State<NeedsMouseWrapper> {
  bool isHovered = false;
  bool hasNavigated = false;
  Timer? _hoverTimer;

  @override
  void dispose() {
    _hoverTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => isHovered = true);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;

          widget.onHoverStart();

          if (widget.onNavigate != null) {
            _hoverTimer = Timer(
              const Duration(milliseconds: 500),
                  () {
                if (isHovered && !hasNavigated) {
                  hasNavigated = true;
                  widget.onNavigate!();
                }
              },
            );
          }
        });
      },
      onExit: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;

          setState(() {
            isHovered = false;
            hasNavigated = false;
          });

          _hoverTimer?.cancel();
          widget.onHoverEnd();
        });
      },
      child: widget.child,
    );
  }
}
