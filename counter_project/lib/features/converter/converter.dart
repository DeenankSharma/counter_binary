import 'package:counter_project/features/home/home.dart'; // Assuming Home is imported
import 'package:flutter/material.dart';
import 'package:counter_project/features/converter/bloc/converter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../providers/screenIndexProvider.dart';

class Converter extends StatelessWidget {
  final ConverterBloc converterBloc = ConverterBloc();

  @override
  Widget build(BuildContext context) {
    final _binaryController = TextEditingController();
    final _screenindexprovider = Provider.of<screenIndexProvider>(context);
    int currentScreenIndex = _screenindexprovider.fetchCurrentScreenIndex;

    Widget currentScreen = currentScreenIndex == 0 ? Home() : Converter();
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
                          converterBloc.add(Convertbuttonclickedevent(
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
                      'The output is: ${context.watch<ConverterBloc>().state is Convertbuttonclickedstate ? (context.watch<ConverterBloc>().state as Convertbuttonclickedstate).decimal : ""}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    currentScreen,
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
  }
}
