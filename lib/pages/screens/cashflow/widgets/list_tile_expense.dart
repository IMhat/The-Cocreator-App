import 'package:flutter/material.dart';

class ListtileExpense extends StatelessWidget {
  final textTitle = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black);
  final textSubTitle = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey);

  const ListtileExpense({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const ListTile(
            dense: true,
            title: Text(
              'Expense',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Divider(
            indent: 2,
            color: Colors.black26,
          ),
          ListTile(
            dense: true,
            title: Text('Pulsa Tsel', style: textTitle),
            trailing: Column(
              children: const [
                SizedBox(
                  height: 5,
                ),
                Text(
                  '-Rp. 150.000',
                  style: TextStyle(color: Color(0xffEC4D3F)),
                ),
              ],
            ),
            subtitle: Text(
              '10 Jun 2021',
              style: textSubTitle,
            ),
          ),
          const Divider(
            indent: 2,
            color: Colors.black26,
          ),
          ListTile(
            dense: true,
            title: Text('Tas Gucci', style: textTitle),
            trailing: Column(
              children: const [
                SizedBox(
                  height: 5,
                ),
                Text(
                  '-Rp. 150.000',
                  style: TextStyle(color: Color(0xffEC4D3F)),
                ),
              ],
            ),
            subtitle: Text(
              '10 Jun 2021',
              style: textSubTitle,
            ),
          ),
          const Divider(
            indent: 2,
            color: Colors.black26,
          ),
          ListTile(
            dense: true,
            title: Text('Boneka Bare Bear', style: textTitle),
            trailing: Column(
              children: const [
                SizedBox(
                  height: 5,
                ),
                Text(
                  '-Rp. 150.000',
                  style: TextStyle(color: Color(0xffEC4D3F)),
                ),
              ],
            ),
            subtitle: Text(
              '10 Jun 2021',
              style: textSubTitle,
            ),
          ),
          const Divider(
            indent: 2,
            color: Colors.black26,
          ),
          ListTile(
            dense: true,
            title: Text('Microphone', style: textTitle),
            trailing: Column(
              children: const [
                SizedBox(
                  height: 5,
                ),
                Text(
                  '+Rp. 150.000',
                  style: TextStyle(color: Color(0xffEC4D3F)),
                ),
              ],
            ),
            subtitle: Text(
              '10 Jun 2021',
              style: textSubTitle,
            ),
          ),
          const Divider(
            indent: 2,
            color: Colors.black26,
          ),
          ListTile(
            dense: true,
            title: Text('Top Up Shopeepay', style: textTitle),
            trailing: Column(
              children: const [
                SizedBox(
                  height: 5,
                ),
                Text(
                  '+Rp. 150.000',
                  style: TextStyle(color: Color(0xffEC4D3F)),
                ),
              ],
            ),
            subtitle: Text(
              '10 Jun 2021',
              style: textSubTitle,
            ),
          ),
          const Divider(
            indent: 2,
            color: Colors.black26,
          ),
          ListTile(
            dense: true,
            title: Text('Matriks Voucher Belajar', style: textTitle),
            trailing: Column(
              children: const [
                SizedBox(
                  height: 5,
                ),
                Text(
                  '+Rp. 150.000',
                  style: TextStyle(color: Color(0xffEC4D3F)),
                ),
              ],
            ),
            subtitle: Text(
              '10 Jun 2021',
              style: textSubTitle,
            ),
          ),
          const Divider(
            indent: 2,
            color: Colors.black26,
          ),
        ],
      ),
    );
  }
}
