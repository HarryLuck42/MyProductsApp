import 'package:flutter/material.dart';
import 'package:my_products/core/helper/helper.dart';
import 'package:my_products/core/memory/memory_action.dart';

import '../../service/api_repository.dart';
import '../memory/shared/share_preference.dart';
import '../routing/routing.dart';

class BaseProvider extends ChangeNotifier{
  Map<int, bool> loadings = <int, bool>{};

  final sharedPre = SharedPreference();

  final routing = Routing();

  final apiRep = ApiRepository();

  final helper = Helper();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool val, {bool change = true}){
    _isLoading = val;
    if(change){
      notifyListeners();
    }
  }

  bool _isLoading2 = false;

  bool get isLoading2 => _isLoading2;

  setLoading2(bool val, {bool change = true}){
    _isLoading2 = val;
    if(change){
      notifyListeners();
    }
  }

  bool _isLoading3 = false;

  bool get isLoading3 => _isLoading3;

  setLoading3(bool val, {bool change = true}){
    _isLoading3 = val;
    if(change){
      notifyListeners();
    }
  }

  bool _isLoading4 = false;

  bool get isLoading4 => _isLoading4;

  setLoading4(bool val, {bool change = true}){
    _isLoading4 = val;
    if(change){
      notifyListeners();
    }
  }

  bool _isLoading5 = false;

  bool get isLoading5 => _isLoading5;

  setLoading5(bool val, {bool change = true}){
    _isLoading5 = val;
    if(change){
      notifyListeners();
    }
  }

  final memoryAction = MemoryAction(HiveMemoryAction());
}