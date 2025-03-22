import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/theme.dart';

class MobileNavigation extends StatelessWidget {
  const MobileNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Arnab Mondal',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'Flutter Developer',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withOpacity(0.8),
                        ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              context,
              'Home',
              Icons.home,
              true,
              () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              context,
              'About',
              Icons.person,
              false,
              () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              context,
              'Skills',
              Icons.star,
              false,
              () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              context,
              'Projects',
              Icons.work,
              false,
              () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              context,
              'Contact',
              Icons.email,
              false,
              () => Navigator.pop(context),
            ),
            const Divider(),
            _buildDrawerItem(
              context,
              'Download CV',
              Icons.download,
              false,
              () {
                // Download CV logic
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  const Text('Theme'),
                  const Spacer(),
                  Switch(
                    value: false, // Set based on theme state
                    onChanged: (value) {
                      // Toggle theme
                    },
                    activeColor: AppTheme.primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    String title,
    IconData icon,
    bool isActive,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? AppTheme.primaryColor : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? AppTheme.primaryColor : null,
          fontWeight: isActive ? FontWeight.bold : null,
        ),
      ),
      onTap: onTap,
    );
  }
} 