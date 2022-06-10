import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapptest/src/bloc/home/home_bloc.dart';
import 'package:myapptest/src/pages/home/widgets/card_pokemon.dart';

class Home extends StatefulWidget {
 
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String urlBase = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';
  @override
  void initState() {
    
    BlocProvider.of<HomeBloc>(context).add(GetHomePockemones());

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemones'),
        centerTitle: true,
        elevation: 0,
      ),
      body:Container(
        padding:EdgeInsets.all(10),
        child:BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
              print(state.count);
              // return Text('data');
            if(state.results != null ){
                return ListView.builder(
                    itemCount: state.results?.length,
                    itemBuilder:(_, index){
                      var urlTemp = state.results?[index].url?.replaceAll("https://pokeapi.co/api/v2/pokemon/", "").replaceAll("/", "");
                      
                      return CardPokemonHome(
                        url:"$urlBase$urlTemp.png",
                        name: state.results?[index].name,
                      );
                    }
              );
            }else{
              return Center(child: CircularProgressIndicator());
            }
          },
        )
      ),
    );
  }

}