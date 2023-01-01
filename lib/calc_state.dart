import 'package:math_expressions/math_expressions.dart';
import 'package:mobx/mobx.dart';

part 'calc_state.g.dart';

class CalcState extends _CalcState with _$CalcState {
  CalcState();
}

abstract class _CalcState with Store {
  Parser parser = Parser();
  ContextModel cm = ContextModel();

  @observable
  String userInput = "";

  @observable
  String answer = "0";

  @action
  void clean() {
    this.userInput = "";
    this.answer = "0";
  }

  @action
  void delete() {
    this.userInput = this.userInput.substring(0, this.userInput.length - 1);
  }

  @action
  void addUserInput(String inputChar) {
    this.userInput += inputChar;
  }

  @action
  void result() {
    Expression exp = parser.parse(this.userInput);
    this.answer = exp.evaluate(EvaluationType.REAL, cm).toString();
  }
}
