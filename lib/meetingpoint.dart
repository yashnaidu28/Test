import 'package:flutter/material.dart';

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
  final _xfocusnode = FocusNode();
  final _yfocusnode = FocusNode();

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

      // Determine the clock point interval
      String meetingPointRange = '';
      if (meetingPoint >= 0 && meetingPoint <= 5) {
        meetingPointRange = 'between 12 and 1';
      } else if (meetingPoint > 5 && meetingPoint <= 10) {
        meetingPointRange = 'between 1 and 2';
      } else if (meetingPoint > 10 && meetingPoint <= 15) {
        meetingPointRange = 'between 2 and 3';
      } else if (meetingPoint > 15 && meetingPoint <= 20) {
        meetingPointRange = 'between 3 and 4';
      } else if (meetingPoint > 20 && meetingPoint <= 25) {
        meetingPointRange = 'between 4 and 5';
      } else if (meetingPoint > 25 && meetingPoint <= 30) {
        meetingPointRange = 'between 5 and 6';
      } else if (meetingPoint > 30 && meetingPoint <= 35) {
        meetingPointRange = 'between 6 and 7';
      } else if (meetingPoint > 35 && meetingPoint <= 40) {
        meetingPointRange = 'between 7 and 8';
      } else if (meetingPoint > 40 && meetingPoint <= 45) {
        meetingPointRange = 'between 8 and 9';
      } else if (meetingPoint > 45 && meetingPoint <= 50) {
        meetingPointRange = 'between 9 and 10';
      } else if (meetingPoint > 50 && meetingPoint <= 55) {
        meetingPointRange = 'between 10 and 11';
      } else if (meetingPoint > 55 && meetingPoint <= 60) {
        meetingPointRange = 'between 11 and 12';
      }

      setState(() {
        FocusScope.of(context).unfocus();

        // Time taken by A and B to meet each other
        _timeA =
            'Time taken by A: ${speedA.toStringAsFixed(2)} minutes per 5 cmins.';
        const SizedBox(
          height: 10,
        );
        _timeB =
            'Time taken by B: ${speedB.toStringAsFixed(2)} minutes per 5 cmins.';
        const SizedBox(
          height: 10,
        );

        _result =
            'They will meet at ${meetingPoint.toStringAsFixed(2)} clock-minutes, which is $meetingPointRange.';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting Point Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _xController,
                decoration: InputDecoration(
                    labelText: 'Time taken by A (minutes per 5 cmins)',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                keyboardType: TextInputType.number,
                focusNode: _xfocusnode,
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
                focusNode: _yfocusnode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value for y';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _calculateMeetingPoint();
                    }
                  },
                  child: const Text('Calculate'),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _result,
                style: const TextStyle(fontSize: 18),
              ),
              if (_timeA.isNotEmpty) ...[
                const SizedBox(height: 15),
                Text(
                  _timeA,
                  style: const TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ],
              if (_timeB.isNotEmpty) ...[
                const SizedBox(height: 15),
                Text(
                  _timeB,
                  style: const TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
