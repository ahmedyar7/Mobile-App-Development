import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card',
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(child: ProfileCard()),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF181717), // GitHub dark background
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(2, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              'assets/imgs/GitHub-Profile-Picture.jpg',
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Ahmed Yar',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Computer Science Student @ NUST',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 12),
          Text(
            'Passionate about Python, Data Structures, AI, Cryptography, and Software Development.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.spaceEvenly,
            children: [
              Chip(
                avatar: Image.asset('assets/imgs/python.png'),
                label: Text('Python'),
              ),
              Chip(
                avatar: Image.asset('assets/imgs/flutter.png'),
                label: Text('Flutter'),
              ),
              Chip(
                avatar: Image.asset('assets/imgs/tensorflow.png'),
                label: Text('TensorFlow'),
              ),
              Chip(
                avatar: Image.asset('assets/imgs/keras.png'),
                label: Text('Keras'),
              ),
              Chip(
                avatar: Image.asset('assets/imgs/git.png'),
                label: Text('Git'),
              ),
              Chip(
                avatar: Image.asset('assets/imgs/cpp.png'),
                label: Text('C++'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  final url = Uri.parse('https://github.com/ahmedyar7');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                icon: Image.asset(
                  'assets/imgs/github_logo.png',
                  height: 24,
                  width: 24,
                ),
                label: Text("GitHub"),
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () async {
                  final url = Uri.parse(
                    'https://www.linkedin.com/in/ahmedyar7/',
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                icon: Image.asset(
                  'assets/imgs/linkedin.png',
                  height: 24,
                  width: 24,
                ),
                label: Text("LinkedIn"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
