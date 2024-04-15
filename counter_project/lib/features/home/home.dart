import 'package:flutter/material.dart';
import 'package:counter_project/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homebloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homebloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      buildWhen: (previous, current) => current is HomeState,
      listenWhen: (previous, current) => current is! HomeState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is HomeInitialstate) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter App',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.purple,
            ),
            body: Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Hello World', style: TextStyle(fontSize: 24)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.add),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.arrow_circle_left), label: 'Counter'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.arrow_circle_right_outlined),
                    label: 'Converter'),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Counter App'),
              backgroundColor: Colors.orange,
            ),
            body: const Center(
              child: Text("No data available for current state."),
            ),
          );
        }
        // case Home
      },
    );
    // BlocConsumer(builder:, listener: listener)
    throw UnimplementedError();
  }
}
