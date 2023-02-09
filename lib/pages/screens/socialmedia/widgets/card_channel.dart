import 'package:flutter/material.dart';
import '/../services/chat_service.dart';
import '/../widgets/chat_message.dart';


class CardChannel extends StatelessWidget {
  const CardChannel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: TextButton(onPressed: (() {}), child: const Text('View All')));
    return Container(
        width: size.width * 0.9,
        height: 50,
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
        child: SizedBox(
          height: 400,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: ((context, index) => Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromRGBO(255, 254, 254, 1)!.withOpacity(0.29),
                      offset: const Offset(-1, 1),
                      blurRadius: 20,
                    )
                  ], borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: (() => Navigator.pushNamed(
                          context,
                          '',
                        )),
                    child: const Text('Startup BOSTON',
                        style: TextStyle(fontSize: 20)),
                  ),
                )),
          ),
        ));
  }
  /*
        Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              
               const [
                Text('Startup BOSTON', style: TextStyle(fontSize: 20)),
              ],
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 30),
                child: TextButton(
                    onPressed: (() {}), child: const Text('View All')))
          ],
        ));
        */
}
