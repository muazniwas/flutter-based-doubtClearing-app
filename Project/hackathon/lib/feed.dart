import 'package:flutter/material.dart';
import 'package:hackathon/Tabs/tab1.dart';
import 'package:hackathon/Tabs/tab2.dart';
import 'package:hackathon/Tabs/tab3.dart';

class Feed extends StatefulWidget {
  Momstabs createState() => new Momstabs();
  
}

class Momstabs extends State<Feed>  with SingleTickerProviderStateMixin {
  TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = new TabController(
      vsync: this,
      length: 3,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: new Text('WhatsApp'),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabcontroller,
          indicatorColor: Colors.white,
          tabs: <Tab>[
            new Tab(text: 'Tab1',),
            new Tab(text: 'Tab2',),
            new Tab(text: 'Tab3',)
          ],
        ),
      ),
    body: new TabBarView(
      controller: _tabcontroller,
      children: <Widget>[
        new Tab1(),
        new Tab2(),
        new Tab3(),

      ],
    ),
    );
  }
}