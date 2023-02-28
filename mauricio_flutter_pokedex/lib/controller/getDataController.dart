import 'dart:io';
import 'package:mauricio_flutter_pokedex/models/getDataModel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class GetDataController extends GetxController{
  var isLoading = false.obs;
  var getDataModel= GetDataModel(results: []).obs;

  getDataFromApi() async {
    isLoading.value = true;
    try{
      //var file = File("datos/datosPokemon.json");
      //var text = file.readAsStringSync();
      var response= await Dio().get('https://raw.githubusercontent.com/ramiro45/ApiRestPokeDex/master/data/dataPokemon.json');
      final datax= json.decode(response.data);
      getDataModel.value= GetDataModel.fromJson(datax);
      isLoading.value= false;
    }catch(e){
      print(e);
    }
  }

}