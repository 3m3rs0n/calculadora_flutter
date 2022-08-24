part of 'calculadora_bloc.dart';

@immutable
abstract class CalculadoraEvent {}

class AddNum extends CalculadoraEvent {
  final String num;
  AddNum(this.num);
}

class AddSigno extends CalculadoraEvent {
  final String signo;
  AddSigno(this.signo);
}

class Eval extends CalculadoraEvent {}

class Del extends CalculadoraEvent {}

class C extends CalculadoraEvent {}

class AC extends CalculadoraEvent {}

class AfterEval extends CalculadoraEvent {
  final String str;
  AfterEval(this.str);
}
