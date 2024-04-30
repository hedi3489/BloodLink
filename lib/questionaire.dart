import 'package:flutter/material.dart';
import 'result.dart';

class Questionaire extends StatefulWidget {
  Questionaire({Key? key}) : super(key: key);

  @override
  State<Questionaire> createState() => _QuestionaireState();
}
int canDonate = 0;
class _QuestionaireState extends State<Questionaire> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[700],
        appBar: AppBar(
          title: Text('Before you donate'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            child: Column(
              children: [
                Question(
                  number: 1,
                  text:
                      'Have you traveled to areas with malaria outbreaks in the past 12 months?',
                ),
                RadioExample(),
                Question(
                  number: 2,
                  text:
                      'Have you had a tattoo, body piercing, or acupuncture in the past 6 months?',
                ),
                RadioExample(),
                Question(
                  number: 3,
                  text:
                      'Have you ever tested positive positive for any sexually transmitted diseases?',
                ),
                RadioExample(),
                Question(
                    number: 4,
                    text:
                        'Have you had a major illness or surgery in the past 6 months?'),
                RadioExample(),
                Question(
                    number: 5,
                    text:
                        'Have you taken any medication not prescribed by a doctor in the past 48 hours?'),
                RadioExample(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                          onPressed: () {
                            if(canDonate==5){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Result(canDonate: true)));
                            }else{
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Result(canDonate: false)));
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black87),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(Size(130, 50)),
                          ),
                          child: Text('Next')
                      ),
                    ),
                  ],),
              ],
            ),
          ),
        )
      )
    );
  }
}

class Question extends StatelessWidget {
  const Question({Key? key, required this.number, required this.text})
      : super(key: key);
  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Question $number',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              label: Text(text),
              enabled: false,
              filled: true,
              fillColor: Colors.black54,
              labelStyle: TextStyle(color: Colors.white)),
        ),
        SizedBox(height: 5,),
      ],
    );
  }
}

enum Answer { yes, no }

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});
  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  Answer? _answer = Answer.yes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Yes',style: TextStyle(color: Colors.white)),
              Transform.scale(
                scale: 0.8,
                child: Radio<Answer>(
                  value: Answer.yes,
                  groupValue: _answer,
                  activeColor: Colors.black,
                  onChanged: (Answer? value) {
                    setState(() {
                      _answer = value;
                      canDonate--;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('No',style: TextStyle(color: Colors.white)),
              Transform.scale(
                scale: 0.8, // Adjust the scale as needed
                child: Radio<Answer>(
                  value: Answer.no,
                  groupValue: _answer,
                  activeColor: Colors.black,
                  onChanged: (Answer? value) {
                    setState(() {
                      _answer = value;
                      canDonate++;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
