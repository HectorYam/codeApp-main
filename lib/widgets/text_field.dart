import 'package:code_app/core/singleton/responsive_singleton.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    required this.label,
    required this.icon,
    required this.controller,
    super.key,
  });

  final String label;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      //color: Colors.white,
      child: SizedBox(
        width: ResponsiveSingleton.width * 0.8,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //rounded icon
            SizedBox(
              height: ResponsiveSingleton.height * 0.06,
              width: ResponsiveSingleton.height * 0.06,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.zero,
                child: Icon(
                  icon,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                //hint
                decoration: InputDecoration(
                  hintText: label,
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
