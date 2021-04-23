import 'package:dev_quiz/chalenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/chalenge/widgets/question_indicator/quest_indicator_widget.dart';
import 'package:dev_quiz/chalenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/result_page/result_page.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';
import 'challenge_controller.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  ChallengePage({Key? key, required this.questions, required this.title})
      : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final challengeController = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      challengeController.currentPage = pageController.page!.toInt() + 1;
    });

    super.initState();
  }

  void nextPage() {
    if (challengeController.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(microseconds: 300), curve: Curves.linear);
  }

  void onSelected(bool value) {
    if (value) {
      challengeController.hits++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ValueListenableBuilder<int>(
                valueListenable: challengeController.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: this.pageController,
        children: widget.questions
            .map((e) => QuizWidget(question: e, onSelected: onSelected))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: challengeController.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (value < widget.questions.length)
                  Expanded(
                      child: NextButtonWidget.white(
                    label: "Skip",
                    onTap: () {
                      this.nextPage();
                    },
                  )),
                if (value == widget.questions.length)
                  // SizedBox(
                  //   width: 7,
                  // ),
                  if (value == widget.questions.length)
                    Expanded(
                        child: NextButtonWidget.green(
                            label: 'Finish',
                            onTap: () {
                              //Navigator.pop(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultPageWidget(
                                            title: widget.title,
                                            length: widget.questions.length,
                                            result: challengeController.hits,
                                          )));
                            })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
