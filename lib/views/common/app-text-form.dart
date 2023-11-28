import 'package:cashir_app/theme/color.dart';
import 'package:cashir_app/theme/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'height-spacer.dart';

class AppTextInput extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? label;
  final String? prefixIcon;
  final Icon? suffixIcon;
  final FocusNode focusNode;
  final Function(String value)? onChanged;
  final double height, width, borderRadius;
  final TextInputType textInputType;
  final Function(String)? validate;
  final Color fillColor;
  final bool isPassword, enable;
  final Function()? onTap;
  const AppTextInput(
      {required this.controller,
        this.height = 54,
        this.onTap,
        this.onChanged,
        this.label,
        this.enable = true,
        required this.validate,
        this.fillColor = const Color(0xffF2F2F2),
        this.width = double.maxFinite,
        this.isPassword = false,
        this.borderRadius = 10,
        this.hint = "",
        this.textInputType = TextInputType.text,
        this.prefixIcon,
        Key? key,
        required this.focusNode, this.suffixIcon})
      : super(key: key);

  @override
  State<AppTextInput> createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInput> {
  bool secure = false;
  Color borderColor = Colors.black;
  Color iconColor = Colors.grey;
  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    iconColor = widget.focusNode.hasFocus ? appPrimaryColor : Colors.grey ;
    borderColor = widget.focusNode.hasFocus ? appPrimaryColor
        : widget.controller.text.isEmpty ? Colors.grey.shade200 : Colors.black ;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
          widget.label!,
          style: TextStyle(
              fontSize: ts4,
              fontWeight: FontWeight.w500
          )
        ),
            )
            : Container(),
        HeightSpacer(0.01),
        TextFormField(
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          style: TextStyle(
            color: Color(0xff2E2C34).withOpacity(0.9),
            fontSize: 15
          ),
          obscureText: secure,
          enabled: widget.enable,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          validator: (e) {
            return widget.validate == null ? null : widget.validate!(e!);
          },
          autovalidateMode: AutovalidateMode.disabled,
          decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              hintText: widget.hint,
              hintStyle: TextStyle(color: Colors.grey, fontSize: ts4),
              isDense: false,
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(right: 5, bottom: 0, left: 0, top: 0),
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: iconColor, width: 1.5))
                ),
                child: SvgPicture.asset(
                  widget.prefixIcon!,
                  height: 10,
                  color: iconColor,
                ),
              ),
              suffixIcon: widget.isPassword
                  ? InkWell(
                  onTap: () {
                    setSecure();
                  },
                  child: icon())
                  : widget.suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: borderColor, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide:
                BorderSide(color: Colors.transparent, width: 0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide:
                const BorderSide(color: Colors.transparent, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              fillColor: backgroundColor,
              filled: true
          ),
        ),
      ],
    );
  }

  setSecure() {
    setState(() {
      secure = !secure;
    });
  }

  Widget icon() {
    if (secure) {
      return const Icon(Icons.visibility_outlined);
    } else {
      return const Icon(Icons.visibility_off_outlined);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.isPassword) {
      setState(() {
        secure = true;
      });
    }
  }
}
