

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:alan_voice/alan_voice.dart';

import '../../../widgets/FloatHakeem.dart';
import '../hakim/screens/speech_screen.dart';
import '../profile/widgets/user_image_profile.dart';



class SocialScreen2 extends StatelessWidget {
  static const String routeName = '/social2';
  const SocialScreen2({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderCommunity(),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(right: 280),
                height: 25,
                child: const Text(
                  'Top Communities',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const TopCommunities(),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(right: 250),
                height: 25,
                child: const Text(
                  'Design Communities',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const DesignCommunities(),
            ],
          ),
        ),



        floatingActionButton: FloatingActionButton.extended(
            elevation: 5.0,
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(context,
                  withNavBar: false,
                  screen: SpeechScreen(),
                  pageTransitionAnimation: PageTransitionAnimation.slideUp);
            },
            label: Text(
              'Hakim',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            icon: FloatIaIcon()));
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class TopCommunities extends StatelessWidget {
  const TopCommunities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: ((context, index) => Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey[850]!.withOpacity(0.29),
                  offset: const Offset(-1, 1),
                  blurRadius: 10,
                )
              ], borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: (() => Navigator.pushNamed(
                      context,
                      '',
                    )),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/community1.png',
                      fit: BoxFit.contain,
                    )),
              ),
            )),
      ),
    );
  }
}

class DesignCommunities extends StatelessWidget {
  const DesignCommunities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: ((context, index) => Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey[850]!.withOpacity(0.29),
                  offset: const Offset(-1, 1),
                  blurRadius: 10,
                )
              ], borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: (() => Navigator.pushNamed(
                      context,
                      '',
                    )),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/designcommunity.png',
                      fit: BoxFit.contain,
                    )),
              ),
            )),
      ),
    );
  }
}

class HeaderCommunity extends StatelessWidget {
  const HeaderCommunity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = 'david';
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  //     stops: [
                  //   0.2,
                  //   0.4,
                  // ],
                  colors: [
                Color.fromARGB(255, 143, 200, 241),
                // Color.fromARGB(255, 94, 129, 253),
                Color.fromARGB(255, 70, 106, 234)
              ])),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 220),
            width: 340,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[850]!.withOpacity(0.29),
                    //offset: const Offset(-10, 10),
                    blurRadius: 10,
                  )
                ]),
            child: TextFormField(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  hintText: 'Try searching topics like "Cripto"',
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
        ),
        Positioned(
          top: 60,
          child: SizedBox(
            width: 50,
            height: 50,
            child: IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  Icons.grid_view,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        ),
        Positioned(
          top: 60,
          left: 350,
          child: SizedBox(
            width: 50,
            height: 50,
            child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/profileScreen'),
                child: const UserImageProfile()),
          ),
        ),
        Positioned(
            left: 50,
            top: 130,
            child: SizedBox(
              width: 250,
              child: Row(
                children: [
                  const Text(
                    'Hi, ',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  
                ],
              ),
            )),
        const Positioned(
          left: 50,
          top: 190,
          child: SizedBox(
            width: 350,
            child: Text(
              'Find community by using topics or products',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
