import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BounceWidget extends StatefulWidget {
  Color inavtiveColor;
  Color activeColor;
  double inactiveSize;
  double activeSize;
  Curve curve;
  Duration duration;
  Function onTap;
  IconData activeIcon;
  IconData inactiveIcon;

  BounceWidget({
    Key? key,
    this.inavtiveColor = Colors.grey,
    this.activeColor = Colors.red,
    this.inactiveSize = 40,
    this.activeSize = 50,
    this.activeIcon = Icons.favorite,
    this.inactiveIcon = Icons.favorite_border,
    this.curve = Curves.bounceIn,
    this.duration = const Duration(milliseconds: 1000),
    required this.onTap,
  }) : super(key: key);

  @override
  _BounceWidgetState createState() => _BounceWidgetState();
}

class _BounceWidgetState extends State<BounceWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation colorAnimation;
  late Animation<double> sizeAnimation;
  bool isFavorite = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    colorAnimation = ColorTween(
      begin: widget.inavtiveColor,
      end: widget.activeColor,
    ).animate(_controller);

    sizeAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: widget.inactiveSize,
          end: widget.activeSize,
        ),
        weight: widget.activeSize,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: widget.activeSize,
          end: widget.inactiveSize,
        ),
        weight: widget.activeSize,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFavorite = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        isFavorite = false;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return IconButton(
          onPressed: () {
            if (!isFavorite) {
              _controller.forward();
              isFavorite = true;
            } else {
              _controller.reverse();
              isFavorite = false;
            }
            widget.onTap(isFavorite);
          },
          icon: Icon(
            isFavorite ? widget.activeIcon : widget.inactiveIcon,
            color: colorAnimation.value,
            size: sizeAnimation.value,
          ),
        );
      },
    );
  }
}
