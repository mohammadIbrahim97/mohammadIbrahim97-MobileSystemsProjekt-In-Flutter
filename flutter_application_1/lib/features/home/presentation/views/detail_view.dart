import 'package:flutter/material.dart';
import '../widgets/home_app_bar_widget.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: 28),
            CustomHomeViewAppBar(),
          ],
        ),
      ),
    );
  }
}