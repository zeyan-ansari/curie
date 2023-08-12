import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/ui/screens/second_screen.dart';
import 'package:untitled2/ui/screens/third_screen.dart';
import 'blocs/first_screen/first_screen_bloc.dart';
import 'blocs/first_screen/first_screen_state.dart';
import 'blocs/third_screen/third_screen_bloc.dart';
import 'ui/screens/first_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FirstScreenBloc()),
        BlocProvider(create: (context) => ThirdScreenBloc()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => BlocBuilder<FirstScreenBloc, FirstScreenState>(
            builder: (context, state) {
              if (state is FirstScreenNavigateToSecondState) {
                return SecondScreen();
              }
              return FirstScreen();
            },
          ),
          '/third': (context) => ThirdScreen(),
        },
      ),
    );
  }
}
