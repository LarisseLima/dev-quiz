import 'package:dev_quiz/home/home_repository.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

import 'home_state.dart';

class HomeController {
  //HomeState state = HomeState.empty;
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
    /*  
    await Future.delayed(Duration(seconds: 2));
    user = UserModel(
      name: "Larisse",
      photoUrl:
          "https://avatars.githubusercontent.com/u/64492108?v=4",
    ); */
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
    /* 
     await Future.delayed(Duration(seconds: 2));
    quizzes = [
      QuizModel(
          title: "Flutter",
          questions: [
            QuestionModel(title: "Está curtindo o Flutter?", answers: [
              AnswerModel(title: "Estou curtindo"),
              AnswerModel(title: "ok"),
              AnswerModel(title: "Bastante"),
              AnswerModel(title: "Ótimo", isRight: true),
            ])
          ],
          imagem: AppImages.blocks,
          level: Level.facil)
    ]; */
  }
}
