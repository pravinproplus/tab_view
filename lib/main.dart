import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  TabController? tabController;
  final selectedKey = GlobalKey<_Tab1State>();
  final ssKey = GlobalKey<_Tab2State>();

  @override
  void initState() {
    tabController = TabController(length: myTabs.length, vsync: this);
    super.initState();
  }

  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'LEFT'),
    new Tab(text: 'RIGHT'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Tabs Demo'),
            bottom: TabBar(controller: tabController, tabs: myTabs),
          ),
          body: TabBarView(controller: tabController, children: [
            Tab1(
              tabController: tabController,
            ),
            Tab2(
              tabController: tabController,
            )
          ]),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Tab1 extends StatefulWidget {
  Tab1({Key? key, this.tabController}) : super(key: key);
  TabController? tabController;
  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        child: Text('move tab2'),
        onPressed: () {
          setState(() {});
          widget.tabController!.animateTo((1));
        },
      )),
    );
  }
}

class Tab2 extends StatefulWidget {
  Tab2({Key? key, this.tabController}) : super(key: key);
  TabController? tabController;
  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        child: Text('move tab1'),
        onPressed: () {
          setState(() {});
          widget.tabController!.animateTo((0));
        },
      )),
    );
  }
}
