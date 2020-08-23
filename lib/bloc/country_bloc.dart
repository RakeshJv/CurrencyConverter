

import 'dart:async';
import 'package:money_transfer/api/country_api.dart';
import 'package:money_transfer/bloc/bloc_provide.dart';
import 'package:money_transfer/models/country.dart';
import 'package:money_transfer/util/app_string.dart';

class CountryBloc extends BlocBase{

String url ="https://unpkg.com/";
  CountryAPI api = CountryAPI();
  StreamController<List<Country>> _syncController = StreamController<List<Country>>.broadcast();

  Stream<List<Country>> get country => _syncController.stream;
  Sink get countrySync => _syncController.sink;



  incrementCounter(int id)
  {
    List<Country>  data = [];
    Country  country = Country();
    country.id =1;
    data.add(country);
    countrySync.add(data);
     }

     void getCountry()
     {
       print("getCountry");
       api.makeRequest(Uri.encodeFull(url.trim()+AppString.API_FLAG_EMOJI.trim())).then((value)
       {
         print(value.length);
         countrySync.add(value);
       });
     }


  void dispose() {
    _syncController.close();
  }
}