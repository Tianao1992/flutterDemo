import 'package:favorcate/ui/pages/home/home_appBar.dart';
import 'package:favorcate/ui/pages/home/home_content.dart';
import 'package:favorcate/ui/pages/home/home_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(context),
      body: HomeContent(),
    );
  }
}
