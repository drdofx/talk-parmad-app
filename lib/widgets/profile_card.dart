import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String major;
  final String year;
  final bool isActive;
  final VoidCallback onLogoutPressed;
  final VoidCallback onEditProfilePressed;

  const ProfileCard({
    required this.imageUrl,
    required this.name,
    required this.major,
    required this.year,
    required this.isActive,
    required this.onLogoutPressed,
    required this.onEditProfilePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Color(0xFF70A6F5),
                    ),
                    onPressed: onLogoutPressed,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                      radius: 48.0,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Color(0xFF70A6F5),
                    ),
                    onPressed: onEditProfilePressed,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            Text(
              name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              '$major - $year',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 4.0),
            Text(
              isActive ? 'Active Student' : 'Inactive Student',
              style: TextStyle(
                fontSize: 16.0,
                color: isActive ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
