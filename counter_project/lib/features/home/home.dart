import 'package:counter_project/features/converter/converter.dart';
import 'package:flutter/material.dart';
import 'package:counter_project/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeBloc homebloc;
  @override
  void initState() {
    homebloc = HomeBloc();
    homebloc.add(HomeInitialEvent());
    super.initState();
  }

  // final HomeBloc homebloc = HomeBloc();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      buildWhen: (previous, current) => current is HomeActionState,
      listenWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) {
        if (state is TogglebuttonNavigatestate) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Converter()));
        }
      },
      builder: (context, state) {
        // if (state is HomeInitialstate) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Counter App', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.purple,
          ),
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        BlocBuilder<HomeBloc, HomeState>(
                            bloc: homebloc,
                            builder: (context, state) {
                              if (state is buttonclickedstate) {
                                return Text("${state.number}");
                              } else {
                                return Container();
                              }
                            }),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                homebloc
                                    .add(Plusbuttonclickedevent(state.number));
                              },
                              child: Icon(Icons.add),
                            ),
                            SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {
                                homebloc
                                    .add(Minusbuttonclickedevent(state.number));
                              },
                              child: Icon(Icons.remove),
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 20,
                                ),
                                Text('Value in Binary',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                                BlocBuilder<HomeBloc, HomeState>(
                                  bloc: homebloc,
                                  builder: (context, state) {
                                    if (state is buttonclickedstate) {
                                      return Text("${state.binary}");
                                    } else {
                                      return Container();
                                    }
                                  },
                                )
                              ],
                            )),
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
                      homebloc.add(HomeInitialEvent());
                      break;
                    case 1:
                      homebloc.add(TogglebuttonNavigateevent());
                      break;
                  }
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.arrow_circle_left),
                    label: 'Counter',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.arrow_circle_right_outlined),
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
