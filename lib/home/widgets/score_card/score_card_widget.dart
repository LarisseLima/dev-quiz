import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/home/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  final double percent;
  const ScoreCardWidget({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          height: 136,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Center(
                      child: ChartWidget(
                        percent: percent,
                      ),
                    ),
                    Center(
                      child: Text(
                        "75%",
                        style: AppTextStyles.heading,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Let's begin!",
                          style: AppTextStyles.heading,
                        ),
                        Text(
                          "Complete the challenges and grow up in knowledge!",
                          style: AppTextStyles.body,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
