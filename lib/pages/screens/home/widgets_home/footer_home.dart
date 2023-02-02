import 'package:flutter/material.dart';

class FooterHome extends StatelessWidget {
  const FooterHome({Key? key}) : super(key: key);
  final textSubTitle = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          ListTile(
              dense: true,
              title: const Text(
                'Recent Transaction',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              trailing: TextButton(
                  onPressed: (() {}),
                  child: const Text(
                    'View all',
                    style: TextStyle(color: Colors.blue),
                  ))),
          const ListTile(
            dense: true,
            title: Text(
              'Name',
              style: TextStyle(color: Colors.black),
            ),
            trailing: Text(
              'Price',
              style: TextStyle(fontSize: 12),
            ),
          ),
          const Divider(
            indent: 2,
            color: Colors.black26,
          ),
          ListTile(
            dense: true,
            title: const Text(
              'Nike',
              style: TextStyle(color: Colors.black),
            ),
            trailing: Column(
              children: const [
                SizedBox(
                  height: 5,
                ),
                Text(
                  '-Rp. 150.000',
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  'Tokopedia',
                  style: TextStyle(fontSize: 12),
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
            title: const Text(
              'Adidas',
              style: TextStyle(color: Colors.black),
            ),
            trailing: Column(
              children: const [
                SizedBox(
                  height: 5,
                ),
                Text(
                  '-Rp. 150.000',
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  'Shoppe',
                  style: TextStyle(fontSize: 12),
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
