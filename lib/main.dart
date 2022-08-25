import 'package:calculadora_flutter/bloc/calculadora/calculadora_bloc.dart';
import 'package:calculadora_flutter/widget/resultados.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_flutter/widget/number_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => CalculadoraBloc())],
        child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculadoraBloc = BlocProvider.of<CalculadoraBloc>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora Flutter',
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(child: Container()),
              Resultados(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(
                      text: 'AC',
                      action: () => calculadoraBloc.add(AC()),
                      color: Colors.orange[900]),
                  NumberButton(
                      text: 'C',
                      action: () => calculadoraBloc.add(C()),
                      color: Colors.orange[900]),
                  NumberButton(
                      text: 'DEL',
                      action: () => calculadoraBloc.add(Del()),
                      color: Colors.orange[900]),
                  NumberButton(
                      text: '/',
                      action: () => calculadoraBloc.add(AddSigno('/')),
                      color: Colors.orange[900]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(
                      text: '7',
                      action: () => calculadoraBloc.add(AddNum('7'))),
                  NumberButton(
                      text: '8',
                      action: () => calculadoraBloc.add(AddNum('8'))),
                  NumberButton(
                      text: '9',
                      action: () => calculadoraBloc.add(AddNum('9'))),
                  NumberButton(
                      text: 'x',
                      action: () => calculadoraBloc.add(AddSigno('x')),
                      color: Colors.orange[900]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(
                      text: '4',
                      action: () => calculadoraBloc.add(AddNum('4'))),
                  NumberButton(
                      text: '5',
                      action: () => calculadoraBloc.add(AddNum('5'))),
                  NumberButton(
                      text: '6',
                      action: () => calculadoraBloc.add(AddNum('6'))),
                  NumberButton(
                      text: '-',
                      action: () => calculadoraBloc.add(AddSigno('-')),
                      color: Colors.orange[900]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(
                      text: '1',
                      action: () => calculadoraBloc.add(AddNum('1'))),
                  NumberButton(
                      text: '2',
                      action: () => calculadoraBloc.add(AddNum('2'))),
                  NumberButton(
                      text: '3',
                      action: () => calculadoraBloc.add(AddNum('3'))),
                  NumberButton(
                      text: '+',
                      action: () => calculadoraBloc.add(AddSigno('+')),
                      color: Colors.orange[900]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(
                    text: '0',
                    action: () => calculadoraBloc.add(AddNum('0')),
                    width: 150.0,
                  ),
                  NumberButton(
                      text: '.',
                      action: () => calculadoraBloc.add(AddSigno('.'))),
                  NumberButton(
                    text: '=',
                    action: () => calculadoraBloc.add(Eval()),
                    color: Colors.orange[900],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
