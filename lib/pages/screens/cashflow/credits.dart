import 'package:cocreator/pages/screens/cashflow/widgets/input_credits.dart';
import 'package:cocreator/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CreditsScreen extends StatefulWidget {
  static const String routeName = '/credits';
  const CreditsScreen({Key? key}) : super(key: key);

  @override
  State<CreditsScreen> createState() => _CreditsScreenState();
}

class _CreditsScreenState extends State<CreditsScreen> {
  @override
  Widget build(BuildContext context) {
    // final GlobalKey<FormState> creditsFormKey = GlobalKey<FormState>();

    return Scaffold(
        backgroundColor: AppTheme.primary,
        appBar: AppBar(
          title: const Text('Your Credit'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 1500,
                child: CustomPaint(
                  painter: _HeaderDiagonalPainter(),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 30, top: 20),
                    child: Form(
                        child: Column(
                      children: [
                        const InputsCredits(
                          icon: Icons.person,
                          labelText: 'Name',
                          hintText: 'Name',

                          keyboardType: TextInputType.text,
                          //  formValues: formValues
                        ),
                        const SizedBox(height: 10),
                        const InputsCredits(
                          icon: Icons.email,
                          labelText: 'Email',
                          hintText: 'Email',

                          keyboardType: TextInputType.emailAddress,
                          // formValues: formValues
                        ),
                        const SizedBox(height: 10),
                        const InputsCredits(
                          icon: Icons.phone,
                          labelText: 'Number Phone',
                          hintText: 'Number Phone',

                          keyboardType: TextInputType.number,
                          //   formValues: formValues
                        ),
                        const SizedBox(height: 10),
                        const InputsCredits(
                          icon: Icons.price_change_rounded,
                          labelText: 'Amount Requested',
                          hintText: 'Amount Requested',

                          keyboardType: TextInputType.number,
                          // formValues: formValues
                        ),
                        const SizedBox(height: 10),
                        const InputsCredits(
                          icon: Icons.date_range,
                          labelText: 'payment deadline',
                          hintText: 'payment deadline',

                          keyboardType: TextInputType.datetime,
                          // formValues: formValues
                        ),
                        const SizedBox(height: 10),
                        const InputsCredits(
                          icon: Icons.percent,
                          labelText: 'Monthly Interest',
                          hintText: 'Monthly Interest',

                          keyboardType: TextInputType.number,
                          //  formValues: formValues
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 100),

                          //color: Colors.white,
                          child: Column(
                            children: [
                              const Text(
                                'Terms and Conditions',
                                style: TextStyle(color: Colors.white),
                              ),
                              //CheckConditions(),
                              Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextButton(
                                    onPressed: (() {}),
                                    child: const Text(
                                      'Apply',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    lapiz.color = Colors.white;
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
