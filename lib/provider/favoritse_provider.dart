import 'package:flutter/cupertino.dart';

class FavProvider extends ChangeNotifier{
  List<int> _selectFav=[];
  List<int> get selectFav => _selectFav;

  void addItem(int value){
    selectFav.add(value);
    notifyListeners();
  }
  void removeItem(int value){
    selectFav.remove(value);
    notifyListeners();
  }


}