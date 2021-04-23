import 'package:dev_quiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;

  final VoidCallback onTap;

  NextButtonWidget({
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
  });

  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.label = label,
        this.borderColor = AppColors.green,
        this.onTap = onTap;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.lightGrey,
        this.fontColor = AppColors.white,
        this.label = label,
        this.borderColor = AppColors.border,
        this.onTap = onTap;

  NextButtonWidget.purple({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.label = label,
        this.borderColor = AppColors.border,
        this.onTap = onTap;

  NextButtonWidget.transparent(
      {required String label, required VoidCallback onTap})
      : this.backgroundColor = Colors.transparent,
        this.fontColor = AppColors.grey,
        this.label = label,
        this.borderColor = AppColors.border,
        this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(this.backgroundColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            side:
                MaterialStateProperty.all(BorderSide(color: AppColors.border)),
          ),
          onPressed: onTap,
          child: Text(label,
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: this.fontColor,
              )),
        ));
  }
}
