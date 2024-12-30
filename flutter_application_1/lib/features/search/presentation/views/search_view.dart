import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:shake/shake.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<String> _texts = [];
  String _randomText = 'Shake the phone to read about a random topic';

  @override
  void initState() {
    super.initState();
    _fetchTexts();
    ShakeDetector.autoStart(
      onPhoneShake: _showRandomText,
    );
  }

  Future<void> _fetchTexts() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('texts').get();
      List<String> texts = [];
      for (var doc in snapshot.docs) {
        (doc.data() as Map<String, dynamic>).forEach((key, value) {
          if (value is String) {
            texts.add(value);
          }
        });
      }
      setState(() {
        _texts = texts;
      });
      print('Fetched texts: $_texts'); // Debug print
    } catch (e) {
      print('Error fetching texts: $e'); // Debug print
    }
  }

  void _showRandomText() {
    if (_texts.isNotEmpty) {
      setState(() {
        _randomText = _texts[Random().nextInt(_texts.length)];
      });
      print('Random text: $_randomText'); // Debug print
    } else {
      print('No texts available'); // Debug print
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 60,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.primaryColor,
                          prefixIcon: Icon(Icons.search_rounded, color: AppColors.offWhite),
                          hintText: 'Shake the phone to read',
                          hintStyle: CustomTextStyles.poppins500style18white,
                          border: getBorderStyle(),
                          enabledBorder: getBorderStyle(),
                          focusedBorder: getBorderStyle(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _randomText,
              style: CustomTextStyles.poppins400style20,
              textAlign: TextAlign.center,
            ),
            /*const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showRandomText, // Simulate shake event
              child: const Text('Simulate Shake'),
            ),*/
          ],
        ),
      ),
    );
  }

  OutlineInputBorder getBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: AppColors.grey),
    );
  }
}