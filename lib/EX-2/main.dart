import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home:  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children:  [
          FavoriteCard(isFavorite: true),
          FavoriteCard(isFavorite: false),
          FavoriteCard(isFavorite: true),
        ],
      ),
    ),
  ),  
);

class FavoriteCard extends StatefulWidget {
  final bool isFavorite;

  const FavoriteCard({
    super.key,
    required this.isFavorite,
  });

  @override
  State<FavoriteCard> createState() => _FavCardState();
}

class _FavCardState extends State<FavoriteCard> {
  late bool initialFavorite;

  @override
  void initState() {
    super.initState();
    initialFavorite = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
     initialFavorite = !initialFavorite;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: .5, color: Colors.grey),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'title',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 10.0),
                      Text('description')
                    ],
                  ),
                ),
                IconButton(
                  onPressed: toggleFavorite,
                  icon: Icon(
                      Icons.favorite,
                      color: initialFavorite ? Colors.red : Colors.grey,
                    ),
                  ),
              ],
            ),
          );
  }
}