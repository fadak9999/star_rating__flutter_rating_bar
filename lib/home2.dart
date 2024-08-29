import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  //
  double _rating = 0.0;
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 217, 207, 207),
        title: const Text('                            ᓚᘏᗢ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 20),
                ),
                child: Image.network(
                  "https://hips.hearstapps.com/hmg-prod/images/cat-quotes-connie-willis-64dfd043d5a9e.jpg?crop=1xw:1xh;center,top&resize=980:*",
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                  child: Text(
                "I Agree ...?",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 174, 132, 5)),
              )),
              const SizedBox(height: 30),
              Center(
                child: RatingBar.builder(
                  itemSize: 50.0, // حجم النجوم
                  initialRating: _rating, //متغير القيمه الابتدائيه للنجوم
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true, //يفعل خاصيه وضع نصف نجمه
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.pets,
                    color: Color.fromARGB(255, 126, 175, 104),
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Rating: ($_rating) stars🎉🐾',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
