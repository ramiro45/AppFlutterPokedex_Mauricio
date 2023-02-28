import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

class DetailsScreen extends StatefulWidget {
  final heroTag;
  final wpokNom;
  final wpokTipo;
  final wpokNum;
  final wpokImg;
  
  final wpokAltura;
  final wpokPeso;

  const DetailsScreen({Key? key,this.heroTag, this.wpokNom,this.wpokTipo,this.wpokNum, this.wpokImg,this.wpokAltura,this.wpokPeso}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: 
      widget.wpokTipo=="Grass" ? Colors.greenAccent
      : widget.wpokTipo=="Fire" ?Colors.redAccent
      : widget.wpokTipo=="Water" ?Colors.blueAccent
      : widget.wpokTipo=="Bug" ?Colors.lightGreenAccent
      : widget.wpokTipo=="Poison" ?Colors.purpleAccent
      : widget.wpokTipo=="Electric" ?Colors.amber
      : widget.wpokTipo=="Ground" ?Colors.brown
      : widget.wpokTipo=="Fighting" ?Colors.orange
      : widget.wpokTipo=="Psychic" ?Colors.pinkAccent
      : widget.wpokTipo=="Dragon" ?Colors.blueGrey
      : widget.wpokTipo=="Rock" ?Colors.grey
      : widget.wpokTipo=="Ice" ?Colors.lightBlue
      : Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _FeclaAtras(),
          _NombreNumeroPokemon(),
          _TipoPokemon(),
          _PokeballFondo(),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height*0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                //Aqui se aplica el diseño de borde del detalle del elemento(Pokemon)
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                )  
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: width*0.3,
                            child: Text(
                              "Altura",
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.wpokAltura.toString(),
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          )
                        ],
                      ), 
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: width*0.3,
                            child: Text(
                              "Peso",
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.wpokPeso.toString(),
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          )
                        ],
                      ), 
                    ),
                  ],
                ),
              ),
            )
          ),
          Positioned(
            top: (height*0.20),
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                imageUrl: widget.wpokImg,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget _FeclaAtras(){
    return Positioned(
        top: 35,
        left: 5,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        )
    );    
  }

  Widget _NombreNumeroPokemon(){
    return Positioned(
      top: 90,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.wpokNom.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "#"+widget.wpokNum.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      )
    );
  }

  Widget _TipoPokemon(){
    return Positioned(
      top: 130,
      left: 25,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Text(
            widget.wpokTipo.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 15
            )
          )
        ),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      )
    );
  }

  Widget _PokeballFondo(){
    var height= MediaQuery.of(context).size.height;
    return Positioned(
      top: height*0.18 ,
      right: -30,
      child: Image.asset(
        'images/pokeball.png',
        height: 200,
        fit: BoxFit.fitHeight,
      )
    );
  }


}