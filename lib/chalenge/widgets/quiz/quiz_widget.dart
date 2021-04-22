import 'package:dev_quiz/chalenge/widgets/awnser/awnser_widget.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AwnserWidget(
              isRight: true,
              isSelected: true,
              title: "Possibilidade compilados nativamente"),
          AwnserWidget(
              isRight: false,
              isSelected: false,
              title: "Possibilidade compilados nativamente"),
          AwnserWidget(
              isRight: false,
              isSelected: true,
              title: "Possibilidade compilados nativamente"),
          AwnserWidget(
              isRight: false,
              isSelected: false,
              title: "Possibilidade compilados nativamente")
        ],
      ),
    );
  }
}
