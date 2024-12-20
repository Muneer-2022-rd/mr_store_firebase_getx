import 'package:flutter/material.dart';

class ScrollableStackedImages extends StatelessWidget {
  const ScrollableStackedImages({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Big Image
              Container(
                height: 400,
                width: double.infinity,
                color: Colors.grey[300], // Placeholder for big image
                child: const Center(child: Text('Big Image')),
              ),
              // Horizontal list of small images
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          width: 80,
                          color:
                              Colors.blueAccent, // Placeholder for small image
                          child: Center(child: Text('Image ${index + 1}')),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          // Other vertical content
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(20, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text('Item ${index + 1}', style: const TextStyle(fontSize: 16)),
              );
            }),
          ),
        ],
      ),
    );
  }
}
