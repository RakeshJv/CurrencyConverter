import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_transfer/models/beneficary.dart';
import 'package:money_transfer/models/country.dart';
import 'package:money_transfer/util/app_colors.dart';
import 'package:money_transfer/util/app_string.dart';

class BeneficiaryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BeneficiaryScreenState();
}

class _BeneficiaryScreenState extends State<BeneficiaryScreen> {
  Map beneficaryList;
  Map<String, Beneficiary> favirateBeneficaryList;

  String _message = "❤";

  @override
  void initState() {
    super.initState();
    favirateBeneficaryList = new HashMap<String, Beneficiary>();

    beneficaryList = Beneficiary.getBeneficiaryList();
    for (var entry in beneficaryList.entries) {
      print(entry.key);
      print(entry.value);
      Beneficiary b = entry.value;
      if (b.isFavorites) {
        favirateBeneficaryList.putIfAbsent(entry.key, () => (entry.value));
      }
    }
  }

  double height = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:

      Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child:  Column(
              children: <Widget>[
                Container(
                  height: height / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 40.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: new IconButton(
                                      icon: new Icon(
                                          Icons.arrow_back,
                                          color: COLORS.CYAN_BLUE_COLOR
                                      ),
                                      highlightColor: Colors.grey,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: RaisedButton(
                                      child: Text(""),
                                      onPressed: () => {},
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(17.0))),
                                ),
                                Expanded(child: SizedBox()),
                              ])),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[


                            Text(
                              AppString.LABEL_Beneficiary_List,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),


                            new IconButton(
                              icon: new Icon(
                                  Icons.search,
                                  color: COLORS.CYAN_BLUE_COLOR
                              ),
                              highlightColor: Colors.grey,
                              onPressed: () {},
                            ),
                          ]),

                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          AppString.LABEL_My_Favourites,
                          textAlign: TextAlign.left,
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),


                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.all(8),
                            itemCount: favirateBeneficaryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return getMyFavouriteContainer(
                                  favirateBeneficaryList.keys.elementAt(index));
                            }),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          AppString.LABEL_All_Beneficiary,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.all(8),
                            itemCount: beneficaryList.keys.length,
                            itemBuilder: (BuildContext context, int index) {
                              return getAllBeneficicaryContainer(
                                  beneficaryList.keys.elementAt(index));
                            }),
                      )
                    ],
                  ),
                )
              ],
            )),
          ) ,


         floatingActionButton: Container(
        margin: EdgeInsets.only(left: 30),
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(17.0)),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // Replace with a Row for horizontal icon + text
            children: <Widget>[Icon(Icons.person_add),
              Text(" Add Beneficiary",style: TextStyle(fontSize: 15),)],
          ),
          color:   COLORS.CYAN_BLUE_COLOR,
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  Widget getAllBeneficicaryContainer(String keys) {
    Beneficiary beneficiary = beneficaryList[keys];

    return Container(
      color: Colors.white,
      height: 100,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 25,
            child: Container(
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image:
                    DecorationImage(fit: BoxFit.cover, image: NetworkImage('')),
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 70,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        beneficiary.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(beneficiary.accountNumber),
                    Text(beneficiary.bankName),
                  ],
                )),
          ),
          Expanded(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.only(top: 25, bottom: 0),
                child: Column(
                  children: <Widget>[

                    Expanded(
                        child: InkWell(
                          onTap: () {
                            addToFavouvrate(beneficiary);
                          },
                          child: Text(_message ),
                        )),
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            removeFromFavouvrate(beneficiary);
                          },

                          child: Text('🖊️' ,style: TextStyle(
                              color: COLORS.CYAN_BLUE_COLOR
                          ),),
                        )),

                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget getMyFavouriteContainer(String key) {
    Beneficiary beneficiary = favirateBeneficaryList[key];
    return Container(
      color: Colors.black12,
      height: 100,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Icon(
              Icons.list,
              color: Colors.grey,
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image:
                    DecorationImage(fit: BoxFit.cover, image: NetworkImage('')),
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        beneficiary.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(beneficiary.accountNumber),
                    Text(beneficiary.bankName),
                  ],
                )),
          ),
          Expanded(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.only(top: 30, bottom: 0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        removeFromFavouvrate(beneficiary);
                      },
                      child: Text(_message ),
                    )),
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            removeFromFavouvrate(beneficiary);
                          },

                          child: Text('🖊️' ,style: TextStyle(
                              color: COLORS.CYAN_BLUE_COLOR
                          ),),
                        )),

                  ],
                ),
              ))
        ],
      ),
    );
  }

  void removeFromFavouvrate(Beneficiary beneficiary) {
    print(favirateBeneficaryList.length);
    favirateBeneficaryList.remove(beneficiary.accountNumber);
    print(favirateBeneficaryList.length);
    setState(() {});
  }

  void addToFavouvrate(Beneficiary beneficiary) {
    print(favirateBeneficaryList.length);
    Beneficiary add = beneficaryList[beneficiary.accountNumber];
    favirateBeneficaryList.putIfAbsent(add.accountNumber, () => add);
    print(favirateBeneficaryList.length);
    setState(() {});
  }
}
