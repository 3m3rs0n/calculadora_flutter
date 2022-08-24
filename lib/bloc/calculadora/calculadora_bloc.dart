import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:math_expressions/math_expressions.dart';

part 'calculadora_event.dart';
part 'calculadora_state.dart';

class CalculadoraBloc extends Bloc<CalculadoraEvent, CalculadoraState> {
  List<String> signos = ['+', '-', '/', 'x', '.'];
  CalculadoraBloc() : super(CalculadoraState()) {
    on<AC>((event, emit) {
      emit(CalculadoraState());
    });

    on<AddNum>((event, emit) {
      if (state.flag) {
        List<String> h = [state.operacion] + state.historial;
        emit(state.copywith(
            flag: false,
            operacion: event.num,
            result: event.num,
            historial: h));
      } else {
        emit(state.copywith(
            operacion: (state.operacion == '0')
                ? event.num
                : state.operacion + event.num,
            result: (state.result == '0')
                ? event.num
                : TotalExp(state.operacion + event.num)));
      }
    });

    on<AddSigno>((event, emit) {
      String ult = state.operacion.substring(state.operacion.length - 1);
      if (state.flag) {
        List<String> h = [state.operacion] + state.historial;
        emit(state.copywith(
            flag: false, operacion: state.result + event.signo, historial: h));
      } else {
        emit(state.copywith(
            operacion: (signos.contains(ult))
                ? state.operacion.substring(0, state.operacion.length - 1) +
                    event.signo
                : state.operacion + event.signo));
      }
    });

    on<Eval>((event, emit) {
      emit(state.copywith(flag: true));
    });

    on<Del>((event, emit) {
      String wolast = state.operacion.substring(0, state.operacion.length - 1);
      String signo =
          (wolast.isEmpty) ? '' : wolast.substring(wolast.length - 1);
      emit(state.copywith(
          flag: false,
          operacion: (wolast == '') ? '0' : wolast,
          result: (signos.contains(signo))
              ? wolast.substring(0, wolast.length - 1)
              : TotalExp((wolast == '') ? '0' : wolast)));
    });

    on<C>((event, emit) {
      emit(state.copywith(result: '0', operacion: '0', flag: false));
    });
  }
}

String TotalExp(String state) {
  Parser p = Parser();
  String res = state.replaceAll('x', '*');
  Expression exp = p.parse(res);
  String total = exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
  return total;
}
