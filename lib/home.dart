import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<double> _ratings =
      List<double>.filled(5, 0.0); // تعديل لتتناسب مع عدد الصور

  final List<String> imageUrls = [
    'https://www.shutterstock.com/image-photo/heartwarming-moment-between-dog-cat-600nw-2432338827.jpg',
    'https://images.prismic.io/wisdom/ZkKGgEFLKBtrW1Z2_finnishmutationcat-2-.jpg?auto=compress%2Cformat',
    'https://as2.ftcdn.net/v2/jpg/01/87/18/59/1000_F_187185929_LBslGH1X3JcXnpEal0rt7HURlQv1yBmA.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE5wkc0OMXsy3CMnmKoKiAlPGZYKVI-IYUqQ&s',
    'https://media.gettyimages.com/id/615582402/photo/meerkat-cat.jpg?s=612x612&w=gi&k=20&c=-7RTAQWTeu85bRKVpPTkjQ2FUQJ6NlZwxIO4rAQTn38='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 185, 148, 187),
        title: const Text('     ᓚᘏᗢ|. Rate the Images .|ᓚᘏᗢ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عدد الأعمدة
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.7, // نسبة العرض إلى الارتفاع للبطاقة
          ),
          itemCount: imageUrls.length, // عرض جميع الصور في القائمة
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 222, 205, 226),
              elevation: 4.0,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("How much did it affect you?"),
                  ),
                  Expanded(
                    child: Image.network(
                      imageUrls[index],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        RatingBar.builder(
                          itemSize:
                              24.0, // تقليل حجم النجوم لضمان بقاءها في صف واحد
                          initialRating: _ratings[index],
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.favorite,
                            color: Color.fromARGB(255, 255, 7, 7),
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              if (_ratings[index] == rating) {
                                // إذا كان التقييم الحالي هو نفسه التقييم الجديد، قم بإلغاء التقييم
                                _ratings[index] = 0.0;
                              } else {
                                _ratings[index] = rating;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Rating: ${_ratings[index]} stars',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
