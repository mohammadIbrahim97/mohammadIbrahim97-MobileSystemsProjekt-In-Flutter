import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import '../../../../core/functions/navigation.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Future<Map<String, dynamic>?> _getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        if (kDebugMode) {
          print('User data: ${userDoc.data()}');
        } // Debug print
        return userDoc.data() as Map<String, dynamic>?;
      } else {
        if (kDebugMode) {
          print('User document does not exist');
        } // Debug print
      }
    } else {
      if (kDebugMode) {
        print('No user is signed in');
      } // Debug print
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // Set the height of the AppBar
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0), // Add padding to the top
            child: Text(
              'Profile',
              style: CustomTextStyles.poppins400style24,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false, // Remove the back arrow icon button
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching user data'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No user data found'));
          } else {
            var userData = snapshot.data!;
            String fullName = '${userData['firstName']} ${userData['lastName']}';
            String email = userData['email'];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(Icons.person_2_rounded, size: 40, color: AppColors.deebBrown),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fullName,
                            style: CustomTextStyles.poppins400style20,
                          ),
                          Text(
                            email,
                            style: CustomTextStyles.poppins400style18,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Account',
                    style: CustomTextStyles.poppins400styleGrey20,
                  ),
                  const SizedBox(height: 24),
                  ListTile(
                    leading: Icon(
                      Icons.person_2_rounded,
                      color: AppColors.deebBrown,
                    ),
                    title: Text(
                      'Edit Profile',
                      style: CustomTextStyles.poppins400style20,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      customNavigate(context, "/editProfile");
                    },
                  ),
                  const SizedBox(height: 24),
                  Divider(thickness: 1, color: Colors.grey.withOpacity(0.3)),
                  const SizedBox(height: 24),
                  Text(
                    'General',
                    style: CustomTextStyles.poppins400styleGrey20,
                  ),
                  const SizedBox(height: 24),
                  ListTile(
                    leading: Icon(
                      Icons.logout_rounded,
                      color: AppColors.deebBrown,
                    ),
                    title: Text(
                      'Log Out',
                      style: CustomTextStyles.poppins400style20,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      customReplacementNavigate(context, "/signIn");
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}