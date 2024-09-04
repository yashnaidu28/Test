// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MeetingPointApp());
// }

// class MeetingPointApp extends StatelessWidget {
//   const MeetingPointApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Meeting Point Calculator',
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(
//           backgroundColor: Colors.purple[700], // Set a custom color for AppBar
//           foregroundColor: Colors.white, // Set text color in AppBar
//         ),
//         primarySwatch: Colors.purple,
//       ),
//       home: const MeetingPointScreen(),
//     );
//   }
// }

// class MeetingPointScreen extends StatefulWidget {
//   const MeetingPointScreen({super.key});

//   @override
//   _MeetingPointScreenState createState() => _MeetingPointScreenState();
// }

// class _MeetingPointScreenState extends State<MeetingPointScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _xController = TextEditingController();
//   final TextEditingController _yController = TextEditingController();
//   FocusNode xfocusnode = FocusNode();
//   FocusNode yfocusnode = FocusNode();
//   String _result = '';

//   void _calculateMeetingPoint() {
//     final double x = double.tryParse(_xController.text) ?? 0.0;
//     final double y = double.tryParse(_yController.text) ?? 0.0;

//     if (x > 0 && y > 0) {
//       // Speed of A and B in clock-minute per minute
//       double speedA = 5 / x;
//       double speedB = 5 / y;

//       // Relative speed difference since they are walking in different directions
//       double relativeSpeed = speedA - speedB;

//       // Time taken by them to meet
//       double timeToMeet = 60 / relativeSpeed;

//       // Meeting point using A's speed
//       double meetingPoint = (timeToMeet * speedA) % 60;

//       setState(() {
//         _result =
//             'They will meet at ${meetingPoint.toStringAsFixed(2)} clock-minutes.';
//             FocusScope.of(context).unfocus();
//       });
//     } else {
//       setState(() {
//         _result = 'Please enter valid non-zero values for both x and y.';
//       });
//     }
//   }

//  @override
//   dispose(){
//     super.dispose();
//       _xController.dispose();
//       _yController.dispose();
//       }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Meeting Point Calculator'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 controller: _xController,
//                 decoration: InputDecoration(
//                     labelText: 'Time taken by A (clock-minutes)',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12))),
//                 keyboardType: TextInputType.number,
//                 focusNode: xfocusnode,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a value for x';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               TextFormField(
//                 controller: _yController,
//                 decoration: InputDecoration(
//                     labelText: 'Time taken by B (clock-minutes)',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12))),
//                 keyboardType: TextInputType.number,
//                 focusNode: yfocusnode,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a value for y';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState?.validate() ?? false) {
//                     _calculateMeetingPoint();
//                   }
//                 },
//                 child: const Text('Calculate'),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 _result,
//                 style: const TextStyle(fontSize: 18),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(const MeetingPointApp());
}

class MeetingPointApp extends StatelessWidget {
  const MeetingPointApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meeting Point Calculator',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple[700], // Set a custom color for AppBar
          foregroundColor: Colors.white, // Set text color in AppBar
        ),
        primarySwatch: Colors.purple,
      ),
      home: const MeetingPointScreen(),
    );
  }
}

class MeetingPointScreen extends StatefulWidget {
  const MeetingPointScreen({super.key});

  @override
  _MeetingPointScreenState createState() => _MeetingPointScreenState();
}

class _MeetingPointScreenState extends State<MeetingPointScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _xController = TextEditingController();
  final TextEditingController _yController = TextEditingController();

  String _timeA = '';
  String _timeB = '';
  String _result = '';

  void _calculateMeetingPoint() {
    final double x = double.tryParse(_xController.text) ?? 0.0;
    final double y = double.tryParse(_yController.text) ?? 0.0;

    if (x > 0 && y > 0) {
      // Speed of A and B in clock-minute per minute
      double speedA = 5 / x;
      double speedB = 5 / y;

      // Relative speed difference since they are walking in different directions
      double relativeSpeed = speedA - speedB;

      // Time taken by them to meet
      double timeToMeet = 60 / relativeSpeed;

      // Meeting point using A's speed
      double meetingPoint = (timeToMeet * speedA) % 60;

      setState(() {
        // Time taken by A and B to meet each other
        _timeA =
            'Time taken by A: ${speedA.toStringAsFixed(2)} minutes per 5 cmins';
        _timeB =
            'Time taken by B: ${speedB.toStringAsFixed(2)} minutes per 5 cmins';
        _result =
            'They will meet at ${meetingPoint.toStringAsFixed(2)} clock-minutes.';
      });
    } else {
      setState(() {
        _result = 'Please enter valid non-zero values for both x and y.';
        _timeA = '';
        _timeB = '';
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _xController.dispose();
    _yController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting Point Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _xController,
                decoration: InputDecoration(
                    labelText: 'Time taken by A (minutes per 5 cmins)',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value for x';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _yController,
                decoration: InputDecoration(
                    labelText: 'Time taken by B (minutes per 5 cmins)',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value for y';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _calculateMeetingPoint();
                  }
                },
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 20),
              Text(
                _result,
                style: const TextStyle(fontSize: 18),
              ),
              if (_timeA.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(
                  _timeA,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
              if (_timeB.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(
                  _timeB,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
