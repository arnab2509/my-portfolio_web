import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(
          context: context,
          icon: Icons.code,
          url: 'https://github.com/ArnabMdev',
          tooltip: 'GitHub',
        ),
        SizedBox(width: 16),
        _buildSocialIcon(
          context: context,
          icon: Icons.link,
          url: 'https://www.linkedin.com/in/arnab-mondal-2509/',
          tooltip: 'LinkedIn',
        ),
      ],
    );
  }

  Widget _buildSocialIcon({
    required BuildContext context,
    required IconData icon,
    required String url,
    required String tooltip,
  }) {
    return IconButton(
      icon: Icon(icon),
      tooltip: tooltip,
      onPressed: () => _launchURL(url),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
} 