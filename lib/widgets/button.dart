import 'package:code_app/core/singleton/responsive_singleton.dart';
import 'package:flutter/material.dart';

class CustomButtomWidget extends StatelessWidget {
  const CustomButtomWidget({
    required this.onPressed,
    required this.label,
    super.key,
  });
  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveSingleton.width * 0.6,
      height: ResponsiveSingleton.height * 0.06,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          backgroundColor: Colors.blue[200],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: ResponsiveSingleton.proportionalFont(18),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
