//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled2/blocs/third_screen/third_screen_bloc.dart';
//
// import '../../blocs/third_screen/third_screen_event.dart';
// import '../../blocs/third_screen/third_screen_state.dart';
// import '../widgets/success_animtion_widget.dart';
//
// class ThirdScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ThirdScreenBloc(),
//       child: Scaffold(
//         backgroundColor: const Color(0xff3A81F1),
//         body: Center(
//           child: BlocBuilder<ThirdScreenBloc, ThirdScreenState>(
//             builder: (context, state) {
//               if (state is LoadingState) {
//                 print(LoadingState());
//
//                 return CircularProgressIndicator();
//               } else if (state is SuccessState) {
//                 print(SuccessState());
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(height:150,child: SuccessAnimation()),
//                     SizedBox(height: 20),
//                     Text(
//                       'Payment Successful!',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).popUntil((route) => route.isFirst);
//                       },
//                       child: Text('Done'),
//                     ),
//                   ],
//                 );
//               } else {
//                 return ElevatedButton(
//                   onPressed: () {
//                     context.read<ThirdScreenBloc>().add(StartLoadingEvent());
//                   },
//                   child: Text('Proceed with Payment'),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../widgets/success_animtion_widget.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading for 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3A81F1),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150, child: SuccessAnimation()),
            SizedBox(height: 20),
            Text(
              '₹350 Paid',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal,color: Colors.white),
            ),
            SizedBox(height: 20),

            Text(
              'Max Life Pharma'
                  ,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: Colors.white),
            ),
            Text(
              'mlp1920@upi'
              ,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal,color: Colors.white.withOpacity(0.5)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}

// Make sure to replace SuccessAnimation() with your actual success animation widget.
