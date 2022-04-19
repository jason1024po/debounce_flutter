import 'package:flutter/widgets.dart';

class DebounceWidget extends StatefulWidget {
  // default milliseconds
  static int defaultDuration = 2000;

  const DebounceWidget({Key? key, required this.child, this.duration, this.onDebounce}) : super(key: key);

  final Widget child;

  // milliseconds
  final int? duration;

  // callback
  final VoidCallback? onDebounce;

  @override
  State<DebounceWidget> createState() => _DebounceWidgetState();
}

class _DebounceWidgetState extends State<DebounceWidget> {
  bool prevent = false;

  _onPointerUp(_) {
    if (prevent) {
      widget.onDebounce?.call();
      return;
    }
    setState(() => prevent = true);
    Future.delayed(Duration(milliseconds: widget.duration ?? DebounceWidget.defaultDuration), () {
      if (mounted) {
        setState(() => prevent = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: _onPointerUp,
      onPointerCancel: _onPointerUp,
      child: AbsorbPointer(absorbing: prevent, child: widget.child),
    );
  }
}
