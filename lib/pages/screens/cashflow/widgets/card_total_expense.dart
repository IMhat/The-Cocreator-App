import 'package:cocreator/widgets/button_small.dart';
import 'package:flutter/material.dart';

class CardTotaExpense extends StatelessWidget {
  const CardTotaExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.9,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[850]!.withOpacity(0.29),
              //offset: const Offset(-10, 10),
              blurRadius: 5,
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Total Expense',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'RP. 1.250.000',
                  style: TextStyle(fontSize: 20, color: Color(0xffEC4D3F)),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (() {}), child: const Text('View Chart')),
                ButtonSmall(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/credits',
                    );
                  },
                  text: 'Credits',
                ),
              ],
            )
          ],
        ));
  }
}
