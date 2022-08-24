import 'package:flutter/material.dart';
import 'package:calculadora_flutter/widget/number_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
    return MaterialApp(
      title: 'Calculadora Flutter',
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(child: Container()),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: historial.length,
                    itemBuilder: (context, index) {
                      return Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(right: 20, top: 20),
                          child: Opacity(
                              opacity: 0.5,
                              child: Text(historial[index],
                                  style: TextStyle(fontSize: 20))));
                    }),
              ),
              //DATA
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 20),
                child: Opacity(
                    opacity: 1,
                    child: Text('0', style: TextStyle(fontSize: 40))),
              ),
              //Resultado
              Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 20),
                  child: Opacity(
                      opacity: 0.5,
                      child: Text('=0', style: TextStyle(fontSize: 25)))),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(
                      text: 'AC',
                      action: () => print('AC'),
                      color: Colors.orange[900]),
                  NumberButton(
                      text: 'C',
                      action: () => print('C'),
                      color: Colors.orange[900]),
                  NumberButton(
                      text: 'DEL',
                      action: () => print('DEL'),
                      color: Colors.orange[900]),
                  NumberButton(
                      text: '/',
                      action: () => print('/'),
                      color: Colors.orange[900]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(text: '7', action: () => print('7')),
                  NumberButton(text: '8', action: () => print('8')),
                  NumberButton(text: '9', action: () => print('9')),
                  NumberButton(
                      text: 'x',
                      action: () => print('x'),
                      color: Colors.orange[900]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(text: '4', action: () => print('4')),
                  NumberButton(text: '5', action: () => print('5')),
                  NumberButton(text: '6', action: () => print('6')),
                  NumberButton(
                      text: '-',
                      action: () => print('-'),
                      color: Colors.orange[900]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(text: '1', action: () => print('1')),
                  NumberButton(text: '2', action: () => print('2')),
                  NumberButton(text: '3', action: () => print('3')),
                  NumberButton(
                      text: '+',
                      action: () => print('+'),
                      color: Colors.orange[900]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(text: '0', action: () => print('0')),
                  NumberButton(text: '.', action: () => print('.')),
                  NumberButton(
                      text: '+/-',
                      action: () => print('+/-'),
                      color: Colors.orange[900]),
                  NumberButton(
                    text: '=',
                    action: () => print('='),
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
