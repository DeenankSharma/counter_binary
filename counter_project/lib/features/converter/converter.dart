import 'package:counter_project/features/converter/bloc/converter_bloc.dart';
import 'package:counter_project/features/converter/converter.dart';
import 'package:counter_project/features/home/home.dart';
import 'package:counter_project/providers/screenIndexProvider.dart';
import 'package:flutter/material.dart';
import 'package:counter_project/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Converter extends StatelessWidget {

  final ConverterBloc converterbloc = ConverterBloc();

  @override
  Widget build(BuildContext context) {
    final _screenindexprovider = Provider.of<screenIndexProvider>(context);
    int currentScreenIndex = _screenindexprovider.fetchCurrentScreenIndex;
    final _binaryController = TextEditingController();
    return BlocConsumer<ConverterBloc, ConverterState>(
      bloc: converterbloc,
      buildWhen: (previous, current) => current is ConverterActionState,
      listenWhen: (previous, current) => current is ConverterActionState,
      listener: (context, state) {
      },
      builder: (context, state) {
        String text1;
        if (state is ConvertButtonClickedState) {
          text1 = state.decimal;
        } else {
          text1 = "";
        }
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
                          converterbloc.add(ConvertButtonClickedEvent(
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
      },
    );
  }
}
