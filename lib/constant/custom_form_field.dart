
// import 'package:flutter/material.dart';

// class CustomTextFormField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String? labelText;
//   final String? hintText;
//   final bool obscureText;
//   final TextInputType? keyboardType;
//   final String? Function(String?)? validator;
//   final void Function(String)? onFieldSubmitted;
//   final void Function(String)? onChanged;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;

//   const CustomTextFormField({
//     super.key,
//     this.controller,
//     this.labelText,
//     this.hintText,
//     this.obscureText = false,
//     this.keyboardType,
//     this.validator,
//     this.onFieldSubmitted,
//     this.onChanged,
//     this.prefixIcon,
//     this.suffixIcon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Container(
//         width: 300,
//         height: 50,
//         child: TextFormField(
//           controller: controller,
//           obscureText: obscureText,
//           keyboardType: keyboardType,
//           validator: validator,
//           onFieldSubmitted: onFieldSubmitted,
//           onChanged: onChanged,
//           decoration: InputDecoration(
//             labelText: labelText,
//             hintText: hintText, 
//             prefixIcon: prefixIcon,
//             suffixIcon: suffixIcon,
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: 300,
        height: 50,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.blue, // Change this to your desired color
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.blue, // Change this to your desired color
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.grey, // Change this to your desired color
                width: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
