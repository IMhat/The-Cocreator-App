import 'package:cocreator/theme/app_theme.dart';
import 'package:cocreator/widgets/ia.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IaScreen extends StatelessWidget {
  static const String routeName = '/iaScreen';
  const IaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muassist'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Say hi to Hakim.',
                    style: TextStyle(fontSize: 20),
                  ),
                  IaIcon()
                ],
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
                child: Text(
                  'Muatex Technologies has partnered with Amazon Echo and Google Assistant to create a new experience with AI.',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                  width: 160,
                  height: 30,
                  decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextButton(
                      onPressed: (() {}),
                      child: const Text(
                        'Launch Muassist',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Hello, Username',
                    style: TextStyle(fontSize: 20),
                  ),
                  IaIcon()
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 150),
                width: 140,
                height: 80,
                decoration: BoxDecoration(
                    color: const Color(0xff4670B0),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Sai',
                      style: TextStyle(color: Color(0xffBFA5D6), fontSize: 9),
                    ),
                    Text(
                      'CSI range',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Text(
                      '3 times',
                      style: TextStyle(color: Color(0xffBFA5D6), fontSize: 9),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 110),
                    width: 190,
                    height: 90,
                    decoration: BoxDecoration(
                        color: const Color(0xff4670B0),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Sai',
                          style:
                              TextStyle(color: Color(0xffBFA5D6), fontSize: 9),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '-Between 4,000 and 5,000	CSI Certified  -Between 4,000 and 5,000	CSI Certified',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const IaIcon()
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              FloatingActionButton(
                onPressed: (() {}),
                child: const Icon(FontAwesomeIcons.microphone),
              )
            ],
          ),
        ),
      ),
    );
  }
}
