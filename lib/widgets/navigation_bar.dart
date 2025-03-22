import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/theme.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
      color: Theme.of(context).colorScheme.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Text(
            'JD',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          
          // Navigation items
          Row(
            children: [
              _buildNavItem(context, 'Home', true),
              _buildNavItem(context, 'About', false),
              _buildNavItem(context, 'Skills', false),
              _buildNavItem(context, 'Projects', false),
              _buildNavItem(context, 'Contact', false),
            ],
          ),
          
          // Theme toggle and CV download
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.light_mode),
                onPressed: () {
                  // Toggle theme
                },
                color: AppTheme.primaryColor,
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  // Download CV
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: const Text('Download CV'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          // Handle navigation
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isActive ? AppTheme.primaryColor : null,
                    fontWeight: isActive ? FontWeight.bold : null,
                  ),
            ),
            const SizedBox(height: 4),
            if (isActive)
              Container(
                height: 2,
                width: 30,
                color: AppTheme.primaryColor,
              ),
          ],
        ),
      ),
    );
  }
} 