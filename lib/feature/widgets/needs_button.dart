import 'package:flutter/material.dart';
import '../../core/helper/needs_mouse.dart';
import '../../core/helper/tts_helper.dart';

class NeedsButton extends StatefulWidget {
  const NeedsButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.page,
  });

  final String title;
  final Icon icon;
  final Color color;
  final Widget? page;

  @override
  State<NeedsButton> createState() => _NeedsButtonState();
}

class _NeedsButtonState extends State<NeedsButton>
    with SingleTickerProviderStateMixin {
  final TtsHelper ttsHelper = TtsHelper();

  bool isHovered = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    ttsHelper.init();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && widget.page == null) {
        ttsHelper.speakOnce(widget.title);
        _controller.stop();
      }
    });
  }

  void _navigate(BuildContext context) {
    if (widget.page == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => widget.page!),
      );
    });
  }

  @override
  void dispose() {
    ttsHelper.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double buttonHeight =
        MediaQuery.of(context).size.height * 0.14;

    return SizedBox(
      height: buttonHeight,
      child: NeedsMouseWrapper(
        onHoverStart: () {
          setState(() => isHovered = true);

          if (widget.page == null) {
            ttsHelper.stop();
            _controller.forward(from: 0);
          }
        },
        onHoverEnd: () {
          setState(() => isHovered = false);
          _controller.stop();
          _controller.reset();
        },
        onNavigate: widget.page != null
            ? () => _navigate(context)
            : null,
        child: AnimatedScale(
          scale: isHovered ? 1.03 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      return Container(
                        color: Color.lerp(
                          Colors.white,
                          widget.color,
                          _controller.value,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Row(
                      children: [
                        widget.icon,
                        const SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        if (widget.page != null)
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 18,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
