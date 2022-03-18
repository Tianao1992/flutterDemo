import 'package:favorcate/ui/pages/home/home_drawer.dart';
import 'package:favorcate/ui/pages/main/initalise_items.dart';
import 'package:flutter/material.dart';

class HomeMainScreen extends StatefulWidget {
  static final String routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return _HomeMainScreentate();
  }
}

class _HomeMainScreentate extends State<HomeMainScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDarwer(),
      body: IndexedStack(
        index: _currentIndex,
        children: items,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: bottoms,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
