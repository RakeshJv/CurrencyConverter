import 'dart:collection';

class Beneficiary{

  String name;
  String accountNumber;
  bool isFavorites;
  String bankName;
  List<Beneficiary> beneficaryList;



  static  Map getBeneficiaryList(){
    Map< String, Beneficiary> beneficaryList =new HashMap<String, Beneficiary>();

    Beneficiary beneficiary =Beneficiary();
    beneficiary.name ="Alon Vouge";
    beneficiary.accountNumber="1";
    beneficiary.bankName ="Bank Of Baroda";
    beneficiary.isFavorites =true;
    beneficaryList.putIfAbsent(beneficiary.accountNumber, () =>beneficiary);


    beneficiary =Beneficiary();
    beneficiary.name ="Alon Vouge";
    beneficiary.accountNumber="2";
    beneficiary.bankName ="Bank Of Baroda";
    beneficiary.isFavorites =true;
    beneficaryList.putIfAbsent(beneficiary.accountNumber, () =>beneficiary);

    beneficiary =Beneficiary();
    beneficiary.name ="Alon Vouge";
    beneficiary.accountNumber="3";
    beneficiary.bankName ="Bank Of Baroda";
    beneficiary.isFavorites =true;
    beneficaryList.putIfAbsent(beneficiary.accountNumber, () =>beneficiary);

    beneficiary =Beneficiary();
    beneficiary.name ="Alon Vouge";
    beneficiary.accountNumber="4";
    beneficiary.bankName ="Bank Of Baroda";
    beneficiary.isFavorites =true;
    beneficaryList.putIfAbsent(beneficiary.accountNumber, () =>beneficiary);

    beneficiary =Beneficiary();
    beneficiary.name ="Alon Vouge";
    beneficiary.accountNumber="5";
    beneficiary.bankName ="Bank Of Baroda";
    beneficiary.isFavorites =false;
    beneficaryList.putIfAbsent(beneficiary.accountNumber, () =>beneficiary);

    beneficiary =Beneficiary();
    beneficiary.name ="Alon Vouge";
    beneficiary.accountNumber="6";
    beneficiary.bankName ="Bank Of Baroda";
    beneficiary.isFavorites =false;
    beneficaryList.putIfAbsent(beneficiary.accountNumber, () =>beneficiary);
    return beneficaryList;
  }

}