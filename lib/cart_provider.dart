
import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier{
    final List<Map<String,dynamic>> card=[];
    
    void addItem(Map<String,dynamic> m){
      card.add(m);
      notifyListeners();
    }

    void deleteItem(Map<String,dynamic> m){
      card.remove(m);
      notifyListeners();
    }
}