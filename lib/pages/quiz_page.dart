import 'dart:ui';

import 'package:eco_app/api/quiz.dart';
import 'package:eco_app/components/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import '../blocs/login/login_bloc.dart';

class QuizPage extends HookWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = useState<List<Question>?>(null);

    final answers = useState<List<Answer>>(List.generate(3, (index) {
      return Answer(question: index.toString(), answer: '');
    }));

    final state = context.read<LoginBloc>().state;

    useEffect(() {
      getQuiz().then((value) => quiz.value = value);

      return null;
    }, [state]);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sfondofoglie.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoggedIn) {
                context.pop();
              }
            },
            child: SafeArea(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Text('Quiz', style: TextStyle(fontSize: 30)),
                Expanded(
                    child: (quiz.value != null)
                        ? ListView.builder(
                            itemBuilder: (context, i) {
                              return QuizQuestion(
                                  question: quiz.value![i],
                                  onChanged: (value) {
                                    answers.value[i] = Answer(
                                        question: quiz.value![i].id,
                                        answer: value);
                                  });
                            },
                            itemCount: quiz.value?.length,
                          )
                        : const Center(
                            child: CircularProgressIndicator.adaptive())),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
