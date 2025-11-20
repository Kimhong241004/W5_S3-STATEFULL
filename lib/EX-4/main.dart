import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: Score()
    ));

class Score extends StatelessWidget {
  const Score({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(title: Center(child: Text("My Score"))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScoreCard(
            title: "My score in Flutter",
            color: Colors.green[600]!,
            initialScore: 5,
          ),
          ScoreCard(
            title: "My score in Dart",
            color: Colors.green[300]!,
            initialScore: 3,
          ),
          ScoreCard(
            title: "My score in React",
            color: Colors.green[900]!,
            initialScore: 10,
          ),
        ],
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String title;
  final Color color;
  final int initialScore;

  const ScoreCard({
    super.key,
    required this.title,
    required this.color,
    this.initialScore = 0,
  });

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late int score;
  final int maxScore = 10;

  Color get progressColor {
    if (score < maxScore / 3) {
      return Colors.green[300]!;
    } else if (score < 2 * maxScore / 3) {
      return Colors.green[600]!;
    } else {
      return Colors.green[900]!;
    }
  }

  @override
  void initState() {
    super.initState();
    score = widget.initialScore;
  }

  void incrementScore() {
    setState(() {
      if (score < maxScore) {
        score++;
      }
    });
  }

  void decrementScore() {
    setState(() {
      if (score > 0) {
        score--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: decrementScore,
                  icon: const Icon(Icons.remove, size: 30),
                  color: Colors.grey[700],
                ),

                SizedBox(width: 50),

                IconButton(
                  onPressed: incrementScore,
                  icon: const Icon(Icons.add, size: 30),
                  color: Colors.grey[700],
                ),
              ],
            ),

            SizedBox(height: 8),

            Container(
              height: 35,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400]!),
                borderRadius: BorderRadius.circular(5),
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Row(
                  children: [
                    Expanded(
                      flex: score,
                      child: Container(color: progressColor),
                    ),
                    Expanded(
                      flex: maxScore - score,
                      child: Container(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}