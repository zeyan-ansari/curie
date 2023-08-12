import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/ui/screens/third_screen.dart';
import '../../blocs/second_screen/second_screen_bloc.dart';
import '../../blocs/second_screen/second_screen_event.dart';
import '../../blocs/second_screen/second_screen_state.dart';
import '../../blocs/third_screen/third_screen_bloc.dart';
import '../../blocs/third_screen/third_screen_event.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int pinLength = 4; // Default pin length
  String enteredPin = '';
  bool showPin = false; // Add this variable

  Widget _buildNumberButton(BuildContext context, String digit) {
    return GestureDetector(
      onTap: () {
        if (digit == 'back') {
          setState(() {
            if (enteredPin.isNotEmpty) {
              enteredPin = enteredPin.substring(0, enteredPin.length - 1);
            }
          });
        } else if (digit == 'next') {
          // Process enteredPin, navigate to the third screen, etc.
        } else if (enteredPin.length < pinLength) {
          setState(() {
            enteredPin += digit;
          });
        }
      },
      child: Container(
        width: 60,
        height: 70,
        alignment: Alignment.center,
        child: Text(
          digit, // Use showPin to determine whether to show the digit or *
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w600, color: Colors.indigo),
        ),
      ),
    );
  }

  Widget _buildNumberPad(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberButton(context, '1'),
            _buildNumberButton(context, '2'),
            _buildNumberButton(context, '3'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberButton(context, '4'),
            _buildNumberButton(context, '5'),
            _buildNumberButton(context, '6'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberButton(context, '7'),
            _buildNumberButton(context, '8'),
            _buildNumberButton(context, '9'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBackButton(context),
            _buildNumberButton(context, '0'),
            _buildNextButton(context),
          ],
        ),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (enteredPin.isNotEmpty) {
            enteredPin = enteredPin.substring(0, enteredPin.length - 1);
          }
        });
      },
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        child: Icon(
          Icons.backspace,
          color: Colors.indigo,
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.read<ThirdScreenBloc>().add(StartLoadingEvent()); // Dispatch event
        // await Future.delayed(const Duration(seconds: 3)); // Wait for the event to take effect
        Navigator.pushNamed(context, '/third'); // Navigate to the third screen
      },

      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        child: Icon(
          Icons.check_circle,
          color: Colors.indigo,
          size: 50,
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SecondScreenBloc(pinLength),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ICICI Bank',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Transform.scale(
                scale: 0.5,
                child: Image.asset('assets/1280px-UPI-Logo-vector.png',height: 30,))
          ],
        ),
        body: BlocBuilder<SecondScreenBloc, SecondScreenState>(
          builder: (context, state) {
            if (state is SecondScreenInitialState) {
              final pin = state.pin;
              final digits = List.generate(pinLength, (index) {
                final isSelected = index < enteredPin.length;
                return GestureDetector(
                  onTap: () {
                    if (index < enteredPin.length) {
                      setState(() {
                        enteredPin =
                            enteredPin.substring(0, enteredPin.length - 1);
                      });
                    }
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isSelected ? Colors.black : Colors.grey,
                          width: 2.0, // Adjust the width as needed
                        ),
                      ),
                    ),
                    child: Text(
                      isSelected
                          ? showPin
                              ? enteredPin[index]
                              : '*'
                          : '',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.blue : Colors.black,
                      ),
                    ),
                  ),
                );
              });

              return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(padding: EdgeInsets.symmetric(vertical: 12,horizontal: 18),
                    decoration: BoxDecoration(
                      color:Colors.indigo,

                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('RedBus',style: TextStyle(color: Colors.white),),
                        Row(
                          children: [
                            Text('₹ 1.00',style: TextStyle(color: Colors.white)),
                            SizedBox(width:5,),
                            RotatedBox(
                              quarterTurns: 1,
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,color: Colors.white
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ENTER UPI PIN',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            Row(
                              children: [
                                Icon(Icons.remove_red_eye_rounded),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showPin = !showPin; // Toggle showPin
                                    });
                                  },
                                  child: Text(
                                    showPin
                                        ? 'HIDE'
                                        : 'SHOW', // Toggle between HIDE and SHOW
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: digits,
                      ),

                      SizedBox(height: 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('PIN Length: 4'),
                          Switch(
                            value: pinLength == 6,
                            onChanged: (newValue) {
                              setState(() {
                                pinLength = newValue ? 6 : 4;
                              });
                            },
                          ),
                          Text('6'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.bottomCenter,
                        color: Colors.grey.withOpacity(0.2),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            _buildNumberPad(context),
                          ],
                        ),
                      ), // Adding the number pad
                    ],
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator(); // Placeholder for loading or error state
            }
          },
        ),
      ),
    );
  }
}
