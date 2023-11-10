import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.myController,
    this.validator,
    required this.prefix,
    this.label,
    this.sufix,
    this.isSecret = false,
    this.inputFormatters,
  }) : super(key: key);

  final TextEditingController? myController;
  final String Function(String?)? validator;
  final IconData? prefix;
  final String? label;
  final IconData? sufix;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      child: TextFormField(
        maxLength: 20,
        controller: widget.myController!,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        validator: widget.validator,
        decoration: InputDecoration(
          filled: true,
          prefixIconColor: Colors.black,
          suffixIconColor: Colors.black,
          prefixIcon: Icon(
            widget.prefix,
            size: 25,
          ),
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () => setState(() {
                    isObscure = !isObscure;
                  }),
                  icon: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                    size: 25,
                  ),
                )
              : null,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
