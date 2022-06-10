import 'package:flutter/material.dart';

class CardPokemonHome extends StatelessWidget {
  final String? url;
  final String? name;

  const CardPokemonHome({
    this.name,
    this.url
  });

  @override
  Widget build(BuildContext context) {
   
    return Card(
      child: Column(
        children: [
          Image.network(
            "$url",
            loadingBuilder: (context, child, loadingProgress){
              if (loadingProgress == null) return child;

              return const Center(child: Text('Loading...')); 
            },
          ),
          SizedBox(height: 20,),
          Text(
            "$name".toUpperCase(),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}