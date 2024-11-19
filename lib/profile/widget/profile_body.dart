import 'package:debt_manager/login/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/images/user.png',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'john.doe@example.com',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            _buildProfileItem(
              context: context,
              icon: Icons.person_outline,
              title: 'Personal Information',
            ),
            _buildProfileItem(
              context: context,
              icon: Icons.notifications_outlined,
              title: 'Notifications',
            ),
            _buildProfileItem(
              context: context,
              icon: Icons.security_outlined,
              title: 'Security',
            ),
            _buildProfileItem(
              context: context,
              icon: Icons.help_outline,
              title: 'Help & Support',
            ),
            _buildProfileItem(
              context: context,
              icon: Icons.logout,
              title: 'Logout',
              textColor: Colors.red,
              isLogout: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    Color? textColor,
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? const Color(0xFF2C37C6)),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        if (isLogout) {
          // Handle logout
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        }
      },
    );
  }
}
