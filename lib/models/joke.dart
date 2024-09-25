import 'dart:math';


class Joke {
  String setup;
  String punchline;
  int rating;

  Joke(this.setup, this.punchline, this.rating);

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      json['setup'] as String,
      json['punchline'] as String,  
      json['rating'] ?? Random().nextInt(3) + 1, 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'setup': setup,
      'punchline': punchline,
      'rating': rating,
    };
  }
}


