import 'package:flutter/material.dart';

class name extends StatefulWidget {
  name({Key? key}) : super(key: key);

  @override
  _nameState createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BotonBlack extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const BotonBlack({
    Key? key,
    this.text = '',
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        elevation: 2,
        highlightElevation: 5,
        color: Colors.black,
        shape: StadiumBorder(),
        onPressed: this.onPressed,
        child: Container(
            alignment: Alignment.center,
            height: 55,
            width: double.infinity,
            child: Text(this.text,
                style: TextStyle(color: Colors.white, fontSize: 17))),
      ),
    );
  }
}
