

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_transfer/models/country.dart';
import 'package:money_transfer/util/string_util.dart';

import 'dialog_callback.dart';

class CountrySelectionDialog extends StatefulWidget {

//  DialogCallback callback;
  List<Country> countries;
  DialogCallBack callBack;

  CountrySelectionDialog(
      {
    this.countries ,this.callBack
     }
      );

  @override
  CountrySelectionDialogState createState() => CountrySelectionDialogState();

}

class CountrySelectionDialogState extends State<CountrySelectionDialog> {
  List<Country> list = [];
  @override
  void initState()
  {
    list = widget.countries;
    super.initState();
    print(list.length);
  }



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(15.0),
      ),
      title: Container(
        child:Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 6, 0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, bottom: 0, top: 0),
              child: InkWell(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                          onChanged: (data)
                          {
                             setState(() {
                               if (data.isNotEmpty)
                               {
                                 list = list
                                     .where((u) => (u.name
                                     .toString()
                                     .toLowerCase()
                                     .contains(data
                                     .toString()
                                     .toLowerCase()) ||
                                     u.name.toString()
                                         .toLowerCase()
                                         .contains(data
                                         .toString()
                                         .toLowerCase())))
                                     .toList();
                               } else {
                                 list = list;
                               }
                             });
                          },
                          decoration: InputDecoration(
                            hintText: "Search field",
                            prefixIcon:
                             Icon(Icons.search),
                             ),
                        )),

                  ],
                ),
                onTap: () {

                  print("filter icon clicked");
                },
              ),
            ),

          ),
        ),
      ) ,
      content: Container(
          width: double.maxFinite,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding:
            EdgeInsets.only(left: 6.0, right: 6, bottom: 6, top: 5),
            itemCount: list.length + 1,
            itemBuilder: (BuildContext context, int index)
            {
              if (list.length == index) {
                return SizedBox();
              }
              return Container(
                child: InkWell(
                  onTap: (){
                    widget.callBack.getCountry(list.elementAt(index));
                    Navigator.pop(context,list.elementAt(index));


                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:<Widget> [
                     Text(StringUtil.utf8convert(list[index].code.toUpperCase() )
                       ,style: TextStyle(fontSize: 25), ),
                      Padding(
                        padding: EdgeInsets.only(top :10 ,left: 15),
                        child: Wrap(

            children:<Widget> [  Text(list[index].name ,style: TextStyle(fontSize: 17 ,),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,),],
            ),



                      )
                    ],
                  ),

                ),
              );
            },
          )
      ),
    );
  }
}
