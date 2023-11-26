import 'package:cashir_app/theme/color.dart';
import 'package:cashir_app/theme/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color? enabledBtnColor;
  final Color? disabledBtnColor;
  final Color? textColor;
  final bool? enabled;
  final Function() onTap;
  const AppButton( this.text, {super.key, this.enabledBtnColor, this.textColor, this.enabled, required this.onTap, this.disabledBtnColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled == null ? onTap : enabled! ? onTap : null,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: enabled == null ?
          enabledBtnColor ?? appPrimaryColor
              : enabled! ? enabledBtnColor ?? appPrimaryColor : disabledBtnColor ?? appPrimaryColor.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: enabled != null ? enabled! ? textColor ?? Colors.white : Colors.black
                      : textColor ?? Colors.white,
                  fontSize: ts3
              ),
            ),
          ),
        ),
      ),
    );
  }
}
