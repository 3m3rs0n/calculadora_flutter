part of 'calculadora_bloc.dart';

class CalculadoraState {
  final String result;
  final String operacion;
  final List<String> historial;
  final bool flag;

  CalculadoraState(
      {this.result = '0',
      this.operacion = '0',
      this.historial = const [],
      this.flag = false});

  CalculadoraState copywith(
          {String? result,
          String? operacion,
          List<String>? historial,
          bool? flag}) =>
      CalculadoraState(
          result: result ?? this.result,
          operacion: operacion ?? this.operacion,
          historial: historial ?? this.historial,
          flag: flag ?? this.flag);
}
