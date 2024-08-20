import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String hintText;
  final Icon? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomInputField(
      {Key? key,
      required this.hintText,
      this.suffixIcon,
      this.obscureText = false,
      this.controller})
      : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.9,
      child: TextFormField(
        obscureText: (widget.obscureText && _obscureText),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
          fillColor: const Color.fromARGB(255, 212, 212, 212),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          hintText: widget.hintText,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.remove_red_eye
                        : Icons.visibility_off_outlined,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : Padding(
                  padding: const EdgeInsetsDirectional.only(end: 15),
                  child: widget.suffixIcon,
                ),
          // suffixIconConstraints: (widget.isDense != null)
          //     ? const BoxConstraints(maxHeight: 33)
          //     : null,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (textValue) {
          if (textValue == null || textValue.isEmpty) {
            return 'required!';
          }
          return null;
        },
        controller: widget.controller,
      ),
    );
  }
}
