import 'package:flutter/material.dart';
import 'home.dart';

class Result extends StatelessWidget {
  final bool canDonate;

  Result({required this.canDonate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[700],
      appBar: AppBar(
        title: Text('Results'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: canDonate
                  ? Column(
                      children: [
                        Text(
                          'You can donate <3',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(
                                5), // Adjust the value to change the curvature
                          ),
                          child: Text(
                            'Welcome to our blood donation community! '
                            'Your generosity can save lives. '
                            'Thank you for your willingness to donate and make a difference. '
                            'Together, we can help those in need. Happy donating!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            minimumSize:
                                MaterialStateProperty.all(Size(200, 50)),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => HomePage()));
                          },
                          child: Text(
                            'Go to Home Page',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          'You cannot donate </3',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(
                                5), // Adjust the value to change the curvature
                          ),
                          child: Text(
                            'Thank you for your interest in donating blood. '
                            'Based on the information provided, we regret to inform you '
                            'that you are currently ineligible to donate. '
                            'Please refer to the provided guidelines or consult a '
                            'healthcare professional for further assistance. '
                            'Your willingness to help others is truly appreciated.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            minimumSize:
                                MaterialStateProperty.all(Size(200, 50)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Thank You',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    )),
        ],
      ),
    );
  }
}
