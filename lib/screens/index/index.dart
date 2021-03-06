import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled_goodreads_project/components/bottom-nav-bar.dart';
import 'package:untitled_goodreads_project/constants.dart';
import 'package:untitled_goodreads_project/controller/book-controller.dart';
import 'package:untitled_goodreads_project/screens/collection/collection-screen.dart';
import 'package:untitled_goodreads_project/screens/home/home-screen.dart';
import 'package:untitled_goodreads_project/services/shared.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _selectedItemPosition = 0;

  @override
  void initState() {
    super.initState();
  }

  final _screens = [
    HomeScreen(),
    CollectionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      body: _screens[_selectedItemPosition],
      bottomNavigationBar: Neumorphic(
        style: kNeumorphicStyle.copyWith(
          shadowLightColor: Colors.white60,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 8,
              left: 15,
              child: Align(
                alignment: Alignment.center,
                child: BottomNavBar(),
              ),
            ),
            SnakeNavigationBar(
              elevation: 0,
              style: SnakeBarStyle.floating,
              snakeShape: SnakeShape.circle,
              snakeColor: kPrimaryColor,
              backgroundColor: kLightBackgroundColor,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              // left used to be 230
              padding: EdgeInsets.only(top: 5, bottom: 5, left: size.width * 0.55),
              currentIndex: _selectedItemPosition,
              onPositionChanged: (index) {
                if (index == 1) {
                  Provider.of<BookController>(context, listen: false)
                      .updateBookView(sharedPrefs.bookView);
                }
                setState(() {
                  _selectedItemPosition = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FlareActor(
                      "assets/icons/home-4.flr",
                      alignment: Alignment.center,
                      color: kSecondaryColor,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      MdiIcons.bookshelf,
                      size: 35,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
