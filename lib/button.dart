import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String buttonText;
  final void Function()? onTap;

  const MyButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
          child: Container(
            color: buttonColor,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(fontSize: screenWidth * 0.05, color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class MyButton extends StatelessWidget {
//   final Color buttonColor;
//   final Color textColor;
//   final String buttonText;
//   final void Function()? onTap;
//
//   const MyButton({
//     super.key,
//     required this.buttonColor,
//     required this.textColor,
//     required this.buttonText,
//     this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: Container(
//             color: buttonColor,
//             child: Center(
//               child: Text(
//                 buttonText,
//                 style: TextStyle(fontSize: 20, color: textColor),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
