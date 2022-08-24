import 'package:calculadora_flutter/bloc/calculadora/calculadora_bloc.dart';
import 'package:calculadora_flutter/widget/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Resultados extends StatelessWidget {
  const Resultados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> historial = [
      '123',
      '6545+685',
      '456-56',
      '12314',
      '12314123',
      '1231'
    ];

    return BlocBuilder<CalculadoraBloc, CalculadoraState>(
        builder: ((context, state) {
      return Column(
        children: [
          SizedBox(
            height: 250,
            child: ListView.builder(
                shrinkWrap: true,
                reverse: true,
                itemCount: state.historial.length,
                itemBuilder: (context, index) {
                  return Result(
                    text: state.historial[index],
                    action: () => print('hola'),
                    opacity: 0.5,
                    size: 20.0,
                  );
                }),
          ),
          //DATA
          Result(
            text: state.operacion,
            action: () => print('hola'),
            size: state.flag ? 25.0 : 40.0,
            opacity: state.flag ? 0.5 : 1.0,
          ),
          //Resultado
          Result(
            text: '= ${state.result}',
            action: () => print('hola'),
            opacity: state.flag ? 1.0 : 0.5,
            size: state.flag ? 40.0 : 25.0,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: const Color.fromARGB(255, 139, 139, 139),
          ),
        ],
      );
    }));
  }
}
