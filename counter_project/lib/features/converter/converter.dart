// import 'dart:js';
import 'package:counter_project/features/converter/bloc/converter_bloc.dart';
import 'package:counter_project/features/converter/converter.dart';
import 'package:counter_project/features/home/home.dart';
import 'package:counter_project/providers/screenIndexProvider.dart';
import 'package:flutter/material.dart';
import 'package:counter_project/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Converter extends StatelessWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
  // late HomeBloc homebloc;
  final ConverterBloc converterbloc = ConverterBloc();

  @override
  Widget build(BuildContext context) {
    final _screenindexprovider = Provider.of<screenIndexProvider>(context);
    int currentScreenIndex = _screenindexprovider.fetchCurrentScreenIndex;
    final _binaryController = TextEditingController();

    // if (currentScreenIndex ==0){
    //       Navigator.pushReplacement(
    //           context, MaterialPageRoute(builder: (context) => Converter()));
    //     }
    // Widget currentScreen = currentScreenIndex == 0 ? Home() : Converter();
    return BlocConsumer<ConverterBloc, ConverterState>(
      bloc: converterbloc,
      buildWhen: (previous, current) => current is ConverterActionState,
      listenWhen: (previous, current) => current is ConverterActionState,
      listener: (context, state) {
        // if (state is TogglebuttonNavigatestate) {
        //   Navigator.pushReplacement(
        //       context, MaterialPageRoute(builder: (context) => Converter()));
        // }
      },
      builder: (context, state) {
        String text1;
        if (state is Convertbuttonclickedstate) {
          text1 = state.decimal;
        } else {
          text1 = "";
        }
        // if (state is HomeInitialstate) {
        if (currentScreenIndex == 0) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          });
        }
        return Scaffold(
      appBar: AppBar(
        title: Text('Converter App', style: TextStyle(color: Colors.white)),
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
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          converterbloc.add(Convertbuttonclickedevent(
                              binary: _binaryController.text));
                        },
                        child: Text(
                          'Convert',
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: 20),
                    Text(
                      text1,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    // currentScreen,
                  ],
                ),
              ),
            ),
          ),
          BottomNavigationBar(
            currentIndex: currentScreenIndex,
            onTap: (value) => _screenindexprovider.updateScreenIndex(value),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  (currentScreenIndex == 0)
                      ? Icons.arrow_back_ios
                      : Icons.arrow_back_ios_outlined,
                  color:
                      (currentScreenIndex == 0) ? Colors.purple : Colors.grey,
                ),
                label: 'Counter',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  (currentScreenIndex == 1)
                      ? Icons.arrow_forward_ios
                      : Icons.arrow_forward_ios_outlined,
                  color:
                      (currentScreenIndex == 1) ? Colors.purple : Colors.grey,
                ),
                label: 'Converter',
              ),
            ],
          ),
        ],
      ),
    );
        // } else {
        //   return Scaffold(
        //     appBar: AppBar(
        //       title: const Text('Counter App'),
        //       backgroundColor: Colors.orange,
        //     ),
        //     body: const Center(
        //       child: Text("No data available for current state."),
        //     ),
        //   );
        // }
      },
    );
  }
}
