import 'package:counter_project/features/converter/bloc/converter_bloc.dart';
import 'package:counter_project/features/home/bloc/home_bloc.dart';
import 'package:counter_project/features/home/home.dart';
import 'package:counter_project/providers/screenIndexProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp());
  
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeBloc>(create: (context) => HomeBloc()),
        Provider<ConverterBloc>(create: (context)=>ConverterBloc()),
        ChangeNotifierProvider(create: (context) => screenIndexProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.purple),
        home: Home(),

      ),
    );
  }
}
