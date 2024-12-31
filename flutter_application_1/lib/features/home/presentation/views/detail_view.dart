import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../widgets/home_app_bar_widget.dart';

class DetailView extends StatefulWidget {
  final String itemName;

  const DetailView({super.key, required this.itemName});

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  String _detailText = 'Loading...';
  String _heading = 'Loading...';
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _fetchDetailText();
  }

  Future<void> _fetchDetailText() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('texts').get();
      bool found = false;
      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>?;
        if (data != null && data.containsKey(widget.itemName)) {
          setState(() {
            _detailText = data[widget.itemName];
            _heading = widget.itemName;
          });
          found = true;
          break;
        }
      }
      if (!found) {
        setState(() {
          _detailText = 'No details available';
          _heading = 'No heading available';
        });
      }
    } catch (e) {
      setState(() {
        _detailText = 'Error fetching details: $e';
        _heading = 'Error fetching heading';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(height: 28),
            const CustomHomeViewAppBar(),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                _heading,
                style: CustomTextStyles.poppins400style24,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _isExpanded || _detailText.length <= 200
                          ? _detailText
                          : '${_detailText.substring(0, 200)}...',
                      style: CustomTextStyles.poppins400style20,
                      textAlign: TextAlign.justify,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Text(
                        _isExpanded ? 'Read less' : 'Read more',
                        style: TextStyle(color: AppColors.deepGrey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}