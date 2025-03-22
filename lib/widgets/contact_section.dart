import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildContactInfoItem(
          context,
          icon: Icons.email,
          title: 'Email',
          detail: 'arnabmondal2509@gmail.com',
          onTap: () async {
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: 'arnabmondal2509@gmail.com',
            );
            if (await canLaunchUrl(emailLaunchUri)) {
              await launchUrl(emailLaunchUri);
            }
          },
        ),
        SizedBox(height: 20.0),
        _buildContactInfoItem(
          context,
          icon: Icons.phone,
          title: 'Phone',
          detail: '+91 7602791722',
          onTap: () async {
            final Uri phoneLaunchUri = Uri(
              scheme: 'tel',
              path: '+917602791722',
            );
            if (await canLaunchUrl(phoneLaunchUri)) {
              await launchUrl(phoneLaunchUri);
            }
          },
        ),
        SizedBox(height: 20.0),
        _buildContactInfoItem(
          context,
          icon: Icons.location_on,
          title: 'Location',
          detail: 'Kolkata, India',
          onTap: () async {
            final Uri mapsLaunchUri = Uri.parse(
                'https://www.google.com/maps/search/?api=1&query=Kolkata,India');
            if (await canLaunchUrl(mapsLaunchUri)) {
              await launchUrl(mapsLaunchUri);
            }
          },
        ),
      ],
    );
  }

  Widget _buildContactInfoItem(BuildContext context, {
    required IconData icon,
    required String title,
    required String detail,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(detail),
      onTap: onTap,
    );
  }
} 