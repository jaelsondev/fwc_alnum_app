import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class Button extends StatelessWidget {
  final ButtonStyle style;
  final TextStyle lableStyle;
  final String label;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final bool outline;

  const Button({
    super.key,
    required this.style,
    required this.lableStyle,
    required this.label,
    this.width,
    this.height,
    this.onPressed,
    this.outline = false,
  });

  Button.primary({
    super.key,
    required this.label,
    this.width,
    this.height,
    this.onPressed,
  })  : style = ButtonStyles.i.primaryButton,
        lableStyle = TextStyles.i.textSecondaryFontExtraBold,
        outline = false;

  @override
  Widget build(BuildContext context) {
    final labelText = Text(
      label,
      style: lableStyle,
      overflow: TextOverflow.ellipsis,
    );

    return SizedBox(
      width: width,
      height: height,
      child: outline
          ? OutlinedButton(
              onPressed: onPressed,
              style: style,
              child: labelText,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: style,
              child: labelText,
            ),
    );
  }
}
