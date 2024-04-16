import 'package:counter_project/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:counter_project/features/converter/bloc/converter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  @override
  void initState() {
    converterBloc.add(ConverterInitialEvent());
    super.initState();
  }

  final ConverterBloc converterBloc = ConverterBloc();
  final TextEditingController _binaryController = TextEditingController();
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConverterBloc, ConverterState>(
      bloc: converterBloc,
      buildWhen: (previous, current) => current is ConverterActionState,
      listenWhen: (previous, current) => current is ConverterActionState,
      listener: (context, state) {
        if (state is ToggleButtonBackState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      },
      builder: (context, state) {
        if (state is ConverterInitialState) {
          return Scaffold(
            appBar: AppBar(
              title:
                  Text('Converter App', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.purple,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextField(
                            controller: _binaryController,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Binary Input',
                                hintText: 'Enter your binary number here...'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                converterBloc.add(Convertbuttonclickedevent(
                                    binary: _binaryController.text));
                              },
                              child: Text(
                                'Convert',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(height: 20),
                          Text(
                            'The output is:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<ConverterBloc, ConverterState>(
                            bloc: converterBloc,
                            builder: (context, state) {
                              if(state is Convertbuttonclickedstate){
                                return Text('${state.decimal}') ;
                              }
                              else{
                                return Container();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                    switch (index) {
                      case 0:
                        converterBloc.add(ToggleButtonBackEvent());
                        break;
                      case 1:
                        // Stay on the current screen
                        break;
                    }
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.arrow_circle_left_outlined),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.arrow_circle_right),
                      label: 'Converter',
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
