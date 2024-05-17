// import 'dart:js';
import 'package:counter_project/features/converter/converter.dart';
import 'package:counter_project/providers/screenIndexProvider.dart';
import 'package:flutter/material.dart';
import 'package:counter_project/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
  // late HomeBloc homebloc;
  final HomeBloc homebloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    final _screenindexprovider = Provider.of<screenIndexProvider>(context);
    int currentScreenIndex = _screenindexprovider.fetchCurrentScreenIndex;
    // if (currentScreenIndex ==0){
    //       Navigator.pushReplacement(
    //           context, MaterialPageRoute(builder: (context) => Converter()));
    //     }
    // Widget currentScreen = currentScreenIndex == 0 ? Home() : Converter();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      buildWhen: (previous, current) => current is HomeActionState,
      listenWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) {
        // if (state is TogglebuttonNavigatestate) {
        //   Navigator.pushReplacement(
        //       context, MaterialPageRoute(builder: (context) => Converter()));
        // }
      },
      builder: (context, state) {
        String text;
        if (state is buttonclickedstate) {
          text = state.binary;
        } else {
          text = "";
        }
        // if (state is HomeInitialstate) {
        if (currentScreenIndex == 1) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Converter()),
            );
          });
        }
        // Widget currentScreen = currentScreenIndex == 0 ? this : Converter();
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
                                return Text(
                                  "${state.number}",
                                  style: TextStyle(fontSize: 30),
                                );
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
                                Text(
                                  text,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                // BlocBuilder<HomeBloc, HomeState>(
                                //   bloc: homebloc,
                                //   builder: (context, state) {
                                //     if (state is buttonclickedstate) {
                                //       return Text(
                                //         "${state.binary}",
                                //         style: TextStyle(fontSize: 30),
                                //       );
                                //     } else {
                                //       return Container();
                                //     }
                                //   },
                                // )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              BottomNavigationBar(
                currentIndex: currentScreenIndex,
                onTap: (value) {
                  print(value);
                  _screenindexprovider.updateScreenIndex(value);
                },
                // homebloc.add(TogglebuttonNavigateevent()),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      (currentScreenIndex == 0)
                          ? Icons.arrow_back_ios
                          : Icons.arrow_back_ios_outlined,
                      color: (currentScreenIndex == 0)
                          ? Colors.purple
                          : Colors.grey,
                    ),
                    label: 'Counter',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      (currentScreenIndex == 1)
                          ? Icons.arrow_forward_ios
                          : Icons.arrow_forward_ios_outlined,
                      color: (currentScreenIndex == 1)
                          ? Colors.purple
                          : Colors.grey,
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
