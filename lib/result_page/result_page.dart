import 'package:dev_quiz/chalenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ResultPageWidget extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPageWidget(
      {Key? key,
      required this.title,
      required this.length,
      required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.trophy),
              Column(
                children: [
                  Text(
                    "Congratulations!",
                    style: AppTextStyles.heading40,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text.rich(
                    TextSpan(
                        text: "You have completed\n",
                        style: AppTextStyles.body,
                        children: [
                          TextSpan(
                              text: "$title\n", style: AppTextStyles.bodyBold),
                          TextSpan(
                              text: 'with $result hits of $length questions!',
                              style: AppTextStyles.body),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                            label: "Share",
                            onTap: () {
                              Share.share(
                                  "DevQuiz -Flutter! Resultado do Quiz: $title\n Resultado: ${result / length}% de aproveitamento.");
                            }),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.transparent(
                            label: "Restart",
                            onTap: () {
                              Navigator.pop(context);
                            }),
                      )),
                    ],
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
