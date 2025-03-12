import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // Title
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'LAB # 3',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              // Red container with blue-bordered leaf image
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.red,
                child: Center(
                  child: Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1523712999610-f77fbcfc3843',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Middle section with overlapping elements
              Stack(
                alignment: Alignment.center,
                children: [
                  // Base positioning container
                  Container(height: 200, width: 200),

                  // Blue square
                  Positioned(
                    left: 30,
                    top: 0,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                  ),

                  // Green square overlapping blue square
                  Positioned(
                    left: 85,
                    top: 45,
                    child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.green,
                    ),
                  ),

                  // Red vertical bar with numbers (overlapping with blue box)
                  Positioned(
                    left: 130,
                    top: 0,
                    child: Container(
                      width: 40,
                      height: 200,
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          9,
                          (index) => Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Instruction text
              const Text(
                'PRACTICE MORE THEN THIS. IT WILL HELP YOU',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              ),
              const Text(
                'TO DESIGN COMPLEX MOBILE APP DESIGN',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              ),

              const SizedBox(height: 20),

              // Green footer with leading/trailing text and circle image
              Container(
                width: double.infinity,
                height: 80,
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'LEADING',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Circle image
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1502082553048-f009c37129b9',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const Text(
                      'TRAILING',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
