import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/src/widgets/themewidgets/theme_text.dart';

import '../base/utils/constants/color_constant.dart';
import '../base/utils/constants/fontsize_constant.dart';

class PrimaryTextField extends StatefulWidget {
  final String hint;
  final bool hasNoBorder;
  final bool showLabel;
  final String? label;
  final FocusNode focusNode;
  final TextInputType type;
  final String? trailingIcon;
  final String? leadingIcon;
  final int? maxLength;
  final bool enabled;
  final bool isObscureText;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController controller;
  final Function(String?)? onSaved;
  final String? Function(String?)? validateFunction;
  final Function? endIconClick;
  final Function? startIconClick;
  final Function(String)? onFieldSubmitted;
  final Function()? onTap;
  final Function(String)? onChanged;
  final int maxLines;
  final bool autoFocus;
  final bool hasRightPadding;

  const PrimaryTextField(
      {Key? key,
      required this.hint,
      required this.focusNode,
      required this.type,
      this.label,
      this.showLabel = true,
      this.hasNoBorder = false,
      this.trailingIcon,
      this.leadingIcon,
      this.isObscureText = false,
      required this.textInputAction,
      this.enabled = true,
      this.hasRightPadding = true,
      this.onSaved,
      this.maxLength,
      this.validateFunction,
      this.endIconClick,
      this.startIconClick,
      this.onFieldSubmitted,
      this.onTap,
      this.textInputFormatter,
      this.onChanged,
      required this.controller,
      this.maxLines = 1,
      this.autoFocus = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => PrimaryTextFieldState();
}

class PrimaryTextFieldState extends State<PrimaryTextField> {
  final _isTap = ValueNotifier<bool>(false);
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      if (!widget.focusNode.hasFocus) {
        _isTap.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showLabel
            ? ThemeText(
                text: widget.hint,
                lightTextColor: primaryColor,
                fontSize: fontSize12,
              )
            : const SizedBox(),
        const SizedBox(height: 7.0),
        TextFormField(
          autofocus: widget.autoFocus,
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          maxLength: widget.maxLength,
          focusNode: widget.focusNode,
          textCapitalization: TextCapitalization.sentences,
          enabled: widget.enabled,
          style: const TextStyle(
              color: primaryColor,
              fontSize: fontSize14,
              fontWeight: fontWeightRegular),
          decoration: InputDecoration(
            // hintText: widget.hasNoBorder ? widget.label : "",
            // hintStyle: const TextStyle(
            //   fontSize: fontSize14,
            //   color: hintTextColor,
            // ),
            // constraints: const BoxConstraints(
            //   maxHeight: 50.0,
            // ),
            fillColor: textFieldBgColor,
            filled: true,
            counter: const Offstage(),
            contentPadding: EdgeInsets.fromLTRB(
                16.0, 10.0, (widget.hasRightPadding ? 16.0 : 4.0), 14.0),
            errorStyle: const TextStyle(color: Colors.red),
            errorBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.hasNoBorder ? 10.0 : 24.0),
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
            ),
            errorMaxLines: 3,
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.hasNoBorder ? 10.0 : 24.0),
              borderSide: BorderSide(
                  color: widget.hasNoBorder
                      ? textFieldBgColor
                      : textFieldBorderColor,
                  width: 1,
                  style: BorderStyle.solid),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.hasNoBorder ? 10.0 : 24.0),
              borderSide: BorderSide(
                  color: widget.hasNoBorder
                      ? textFieldBgColor
                      : textFieldBorderColor,
                  width: 1,
                  style: BorderStyle.solid),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.hasNoBorder ? 10.0 : 24.0),
              borderSide: BorderSide(
                  color: widget.hasNoBorder
                      ? textFieldBgColor
                      : textFieldBorderColor,
                  width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.hasNoBorder ? 10.0 : 24.0),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            prefixIcon: _prefixIconCheck(),
            suffixIcon:
                widget.isObscureText ? _passwordIcon() : _suffixIconCheck(),
          ),
          maxLines: widget.maxLines,
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: widget.validateFunction,
          onSaved: widget.onSaved,
          inputFormatters: widget.textInputFormatter,
          keyboardType: widget.type,
          obscureText: widget.isObscureText ? _obscureText : false,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
        ),
      ],
    );
  }

  _suffixIconCheck() => widget.trailingIcon != null
      ? GestureDetector(
          onTap: () {
            widget.endIconClick!();
          },
          child: SizedBox(
            height: 15,
            width: 15,
            child: Image.asset(
              widget.trailingIcon!,
              color: widget.endIconClick == null ? primaryTextColor : null,
              scale: 2.7,
            ),
          ),
        )
      : null;

  _prefixIconCheck() => widget.leadingIcon != null
      ? GestureDetector(
          onTap: () {
            widget.startIconClick!();
          },
          child: SizedBox(
            height: 15,
            width: 15,
            child: Image.asset(
              widget.leadingIcon!,
              scale: 3.5,
            ),
          ),
        )
      : null;

  _passwordIcon() => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: SizedBox(
          height: 10,
          width: 10,
          child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,
              color: primaryColor),
        ),
      );
}


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../base/utils/constants/color_constant.dart';
// import '../base/utils/constants/fontsize_constant.dart';

// class PrimaryTextField extends StatefulWidget {
//   final FocusNode focusNode;
//   final TextInputType type;
//   final String? trailingIcon;
//   final int? maxLength;
//   final bool enabled;
//   final bool isObscureText;
//   final TextInputAction textInputAction;
//   final List<TextInputFormatter>? textInputFormatter;
//   final TextEditingController controller;
//   final Function(String?)? onSaved;
//   final String? Function(String?)? validateFunction;
//   final Function? endIconClick;
//   final Function(String)? onFieldSubmitted;
//   final Function(String)? onChanged;
//   final int maxLines;
//   final bool autoFocus;

//   const PrimaryTextField(
//       {Key? key,
//       required this.focusNode,
//       required this.type,
//       this.trailingIcon,
//       this.isObscureText = false,
//       required this.textInputAction,
//       this.enabled = true,
//       this.onSaved,
//       this.maxLength,
//       this.validateFunction,
//       this.endIconClick,
//       this.onFieldSubmitted,
//       this.textInputFormatter,
//       this.onChanged,
//       required this.controller,
//       this.maxLines = 1,
//       this.autoFocus = false})
//       : super(key: key);

//   @override
//   State<StatefulWidget> createState() => PrimaryTextFieldState();
// }

// class PrimaryTextFieldState extends State<PrimaryTextField> {
//   bool _obscureText = true;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       autofocus: widget.autoFocus,
//       controller: widget.controller,
//       textInputAction: widget.textInputAction,
//       maxLength: widget.maxLength,
//       focusNode: widget.focusNode,
//       textCapitalization: TextCapitalization.sentences,
//       enabled: widget.enabled,
//       style: TextStyle(
//           color: widget.enabled ? primaryTextColor : Colors.grey,
//           fontSize: fontSize16,
//           fontWeight: fontWeightRegular),
//       decoration: InputDecoration(
//         counter: const Offstage(
//           offstage: true,
//         ),
//         contentPadding: const EdgeInsets.all(0.0),
//         floatingLabelBehavior: FloatingLabelBehavior.auto,
//         errorStyle: const TextStyle(color: Colors.red),
//         errorBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.red, width: 1.0),
//         ),
//         errorMaxLines: 3,
//         labelStyle: const TextStyle(fontSize: fontSize14, color: Colors.grey),
//         focusedBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(color: primaryColor, width: 1),
//         ),
//         focusedErrorBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.red, width: 1),
//         ),
//         suffixIcon: widget.isObscureText ? _passwordIcon() : _suffixIconCheck(),
//       ),
//       maxLines: widget.maxLines,
//       onFieldSubmitted: widget.onFieldSubmitted,
//       validator: widget.validateFunction,
//       onSaved: widget.onSaved,
//       inputFormatters: widget.textInputFormatter,
//       keyboardType: widget.type,
//       obscureText: widget.isObscureText ? _obscureText : false,
//       onChanged: widget.onChanged,
//     );
//   }

//   _suffixIconCheck() => widget.trailingIcon != null
//       ? GestureDetector(
//           onTap: () {
//             widget.endIconClick!();
//           },
//           child: SizedBox(
//             height: 15,
//             width: 15,
//             child: Image.asset(
//               widget.trailingIcon!,
//               color: widget.endIconClick == null ? primaryTextColor : null,
//               scale: 2.7,
//             ),
//           ),
//         )
//       : null;

//   _passwordIcon() => InkWell(
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         onTap: () {
//           setState(() {
//             _obscureText = !_obscureText;
//           });
//         },
//         child: SizedBox(
//           height: 15,
//           width: 15,
//           child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,
//               color: primaryTextColor),
//         ),
//       );
// }
