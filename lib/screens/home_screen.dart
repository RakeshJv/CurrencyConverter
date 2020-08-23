import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_transfer/bloc/bloc_provide.dart';
import 'package:money_transfer/bloc/country_bloc.dart';
import 'package:money_transfer/models/country.dart';
import 'package:money_transfer/util/app_colors.dart';
import 'package:money_transfer/util/app_string.dart';
import 'package:money_transfer/util/commom_component.dart';
import 'package:money_transfer/util/string_util.dart';

import 'country_flag_list_dialog.dart';
import 'beneficary_screen.dart';
import 'dialog_callback.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> implements  DialogCallBack{
  int id = 1;
  TextEditingController controller;
  List<Country> countries =[];
  Country _country =Country();
  String  senderCountryemoji,senderCountryMessge,senderCurreyName ;
  String  recieverCountryemoji,recieverCountryMessge,recieverCurreyName ;

   String caller="";
  String computedAmount="1 KWD =24415.95 INR";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _country =Country();

        senderCountryemoji ="KWD";
        senderCountryMessge ="KWD-Kuwait Dinar";
        senderCurreyName ="KWD" ;
        recieverCountryemoji ="INR";
        recieverCountryMessge="INR-Indian Rupee";
        recieverCurreyName ="INR";

  }

  @override
  Widget build(BuildContext context) {
   // final CountryBloc bloc = BlocProvider.of(context);
    return Scaffold(
      body: _getStreamChild(),
    );
  }

  Widget _getStreamChild() {
    final CountryBloc bloc = BlocProvider.of<CountryBloc>(context);
    bloc.getCountry();
    return StreamBuilder(
      initialData: 0,
      stream: bloc.country,
      builder: (BuildContext context, snapshot) {
        data(snapshot);
        return SafeArea(
          child: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                child:  Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 40.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Hello",
                                style: TextStyle(fontSize: 24),
                              ),
                              RaisedButton(
                                  child: Text("reewtew"),
                                  onPressed: () => {},
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(20.0))),
                              new IconButton(
                                icon: new Icon(
                                  Icons.account_circle,
                                  color: COLORS.CYAN_BLUE_COLOR,
                                ),
                                highlightColor: Colors.grey,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BeneficiaryScreen(),
                                    ),
                                  );
                                },
                              ),
                            ])),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Guest",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                          ),
                        ]),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      child: new Container(
                        padding: EdgeInsets.all(10.0),
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                Expanded(
                                  flex:3,
                                  child:Padding(
                                    padding: EdgeInsets.only(left: 15 ,top:0),
                                    child:  Text(StringUtil.utf8convert(senderCountryemoji),textAlign:TextAlign.left,style:
                                    TextStyle(fontSize: 30),
                                    ),
                                  )
                                  

                                ),
                                Expanded(
                                    flex:6,
                                    child:
                                    InkWell(
                                      onTap: (){
                                        showCountryListDialog( context ,"sender");
                                      },
                                      child:  Text(senderCountryMessge),
                                    )
                                ),
                                Expanded(
                                    flex:1,
                                    child:
                                    InkWell(
                                      onTap: (){
                                        showCountryListDialog( context,"sender");
                                        print("data");
                                      },
                                      child:   Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                    )
                                ),
                              ],
                            ),
                            new Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 3,

                                  child:Padding(
                            padding: EdgeInsets.only(left: 15 ,top:0),
                                 child: Text(
                                    senderCurreyName,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
          ),
                                Expanded(
                                  flex: 7,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.black),
                                    controller: controller,
                                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                                    decoration: InputDecoration(
                                      hintText: "Enter Amount",
                                      suffixIcon: _getClearButton(),
                                    ),
                                  ),
                                )
                              ],
                            ),


                            new Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: COLORS.CYAN_BLUE_COLOR),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child:
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                        child: new Container(
                          padding: EdgeInsets.all(10.0),
                          child: new Column(
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  Expanded(
                                    flex:3,
                                    child:Padding(
                                     padding: EdgeInsets.only(left: 15 ,top:0),

                                      child:      Text(StringUtil.utf8convert(recieverCountryemoji)
                                      ,textAlign:TextAlign.left,style: TextStyle(fontSize: 30),),
                                  ),
                                  ),

                                  Expanded(
                                      flex:6,
                                      child:
                                      InkWell(
                                        onTap: (){

                                          showCountryListDialog( context,"receiver");
                                        },
                                        child: Text(recieverCountryMessge),
                                      )
                                  ),
                                  Expanded(
                                      flex:1,
                                      child:
                                      InkWell(
                                        onTap: (){
                                          showCountryListDialog( context,"receiver");
                                          print("data");
                                        },
                                        child:   Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                      )
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                     child:Padding(
                              padding: EdgeInsets.only(left: 15 ,top:0),


                       child: Text(
                                      recieverCurreyName,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),),
                                  Expanded(
                                    flex: 7,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      controller: controller,
                                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                                      decoration: InputDecoration(
                                        hintText: "Enter Amount",
                                        suffixIcon: _getClearButton(),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        computedAmount,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: COLORS.CYAN_BLUE_COLOR),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 30),
                      child: Text(
                        AppString.LABEL_Exchanges_rates_are_indicative,
                        style: TextStyle(   color: COLORS.CYAN_BLUE_COLOR,),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                          padding: EdgeInsets.all(10),
                          child: CommonComponent.getText(
                              AppString.LABEL_SEND_MONEY, 20, Colors.white),
                          onPressed: () => {},
                          color: COLORS.CYAN_BLUE_COLOR,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:10,),
                      child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            getCard(
                                Icon(
                                  Icons.location_on,
                                  color: COLORS.CYAN_BLUE_COLOR,
                                  size: 40,
                                ),

                                Text(AppString.LABEL_LOCATE_BRANCH ,textAlign: TextAlign.center, style: TextStyle(fontSize: 13),) ),


                            getCard(
                                Icon(
                                  Icons.business_center,
                                  color: COLORS.CYAN_BLUE_COLOR,
                                  size: 40,

                                ),
                                Text(AppString.LABEL_PROMOTION)),
                            getCard(
                                Icon(
                                  Icons.chat,
                                  color: COLORS.CYAN_BLUE_COLOR,
                                  size: 40,
                                ),
                                Text(AppString.LABEL_CHAT_WITH_US)),
                          ]),
                    )








                  ],
                )),
              )
        );
      },
    );
  }
  onCountSelected (Country c
      ) {
   // _country =c;
  //("Count was selected."+_country.code);
  }

  String data(AsyncSnapshot snapshot)
  {
  countries = snapshot.data;
  print("countries----------"+countries.length.toString());
    Country c = snapshot.data[0];
        return c.id.toString();

  }

  Widget getCard(Icon icon, Text text) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(

          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            icon,
           Padding(
             padding: EdgeInsets.only(top:12),
             child: text
           )
          ],
        ),
      ),
    );
  }
  Widget _getClearButton() {
        return IconButton(
      onPressed: () => controller.text ="",
      icon: Icon(Icons.clear, color: Colors.black,),
    );
  }
  showCountryListDialog( BuildContext context ,String call){
    caller =call;
     var result= showDialog(
        context: context,
        builder: (context)
        {
          return CountrySelectionDialog(
            countries: countries,callBack: this, );
        });

  }

  @override
  void getCountry(Country country)
  {
    _country =country ;//TODO: implement getCountry
    print(_country.name);
    print(_country.code);
    if(caller=="receiver"){


      recieverCountryemoji =_country.code;
      recieverCountryMessge= _country.code +"-"+_country.name + " currency ";
      recieverCurreyName =_country.code;
    }
    else{

      senderCountryemoji =_country.code;
      senderCountryMessge=_country.code +"-"+_country.name + " currency ";
      senderCurreyName =_country.code;
    }

    computedAmount ="1"+_country.code+ "="+ recieverCurreyName;
    setState(() {

    });

  }


}
