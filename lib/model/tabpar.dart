import 'package:flutter/material.dart';

import 'home.dart';

class BarTapp extends StatefulWidget {
  @override
  _BarTappState createState() => _BarTappState();
}

class _BarTappState extends State<BarTapp> with SingleTickerProviderStateMixin {
  TabController tabController;
  initTabController() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void initState() {
    super.initState();
    initTabController();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    //above scaffold controller in statless
    //DefaultTabController(
    // length: 3,
    return Scaffold(
      appBar: AppBar(
        title: Text('produects'),
        bottom: TabBar(
          controller: tabController,
          // isScrollable: true,
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: ('Home'),
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: ('Favoritte'),
            ),
            Tab(
              icon: Icon(Icons.person),
              text: ('profile'),
            )
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        Home(),
        Faviorte(),
        Center(child: Text('profile')),
      ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (taped) {
            setState(() {
              this.index = taped;
            });

            tabController.animateTo(taped);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'faviorte'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'profile'),
          ]),
    );
  }
}
