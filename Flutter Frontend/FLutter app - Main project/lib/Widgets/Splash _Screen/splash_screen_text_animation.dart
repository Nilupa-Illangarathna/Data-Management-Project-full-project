import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatefulWidget {
  final String text;
  final AnimatedTextSettings settings;
  final Duration duration;
  final TextStyle textStyle;

  AnimatedTextWidget({
    required this.text,
    required this.settings,
    required this.duration,
    required this.textStyle,
  });

  @override
  _AnimatedTextWidgetState createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0, 1, curve: Curves.easeInOut),
    ));

    _animationController.forward();

    _animationController.addStatusListener((status) {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.text.length; i++)
              AnimatedTextItem(
                character: widget.text[i],
                index: i,
                animation: _animation,
                settings: widget.settings,
                textStyle: widget.textStyle,
              ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class AnimatedTextItem extends StatelessWidget {
  final String character;
  final int index;
  final Animation<double> animation;
  final AnimatedTextSettings settings;
  final TextStyle textStyle;

  AnimatedTextItem({
    required this.character,
    required this.index,
    required this.animation,
    required this.settings,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    double fontSize = (index == 0)
        ? (settings.initialFontSize +
        ((settings.endingFontSize - settings.initialFontSize) *
            animation.value))
        : settings.endingFontSize;

    return Opacity(
      opacity: (animation.value * settings.textLength - index).clamp(0.0, 1.0),
      child: Text(
        character,
        style: textStyle.copyWith(
          fontSize: fontSize,
        ),
      ),
    );
  }
}

class AnimatedTextSettings {
  final int textLength;
  final double initialFontSize;
  final double endingFontSize;

  AnimatedTextSettings({
    required this.textLength,
    required this.initialFontSize,
    required this.endingFontSize,
  });
}








// //Calling
// AnimatedTextWidget(
// text: 'Your text goes here',
// settings: AnimatedTextSettings(
// textLength: 10,
// initialFontSize: 16.0,
// endingFontSize: 24.0,
// ),
// duration: Duration(seconds: 2),
// textStyle: TextStyle(
// color: Colors.black,
// fontSize: 16.0,
// ),
// )

