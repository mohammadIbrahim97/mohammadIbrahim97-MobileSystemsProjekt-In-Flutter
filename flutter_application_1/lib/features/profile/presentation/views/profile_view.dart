import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/profile.jpg'), // Replace with actual profile image path
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Name',
                      style: CustomTextStyles.poppins400style20,
                    ),
                    Text(
                      'user.email@example.com',
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
              leading: const Icon(Icons.person_2_rounded),
              title:  Text(
                'Edit Profile',
                style: CustomTextStyles.poppins400style20,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle edit profile tap
              },
            ),
            const SizedBox(height: 24),
            Divider(thickness: 1, color: Colors.grey.withOpacity(0.3),),
            const SizedBox(height: 24),
            Text(
              'General',
              style: CustomTextStyles.poppins400styleGrey20,
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.logout),
              title:  Text(
                'Log Out',
                style: CustomTextStyles.poppins400style20,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle log out tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
