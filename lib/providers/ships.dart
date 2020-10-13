import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/ship.dart';

class Ships with ChangeNotifier {
  List<Ship> _items = [];

  List<Ship> get items {
    return [..._items];
  }

  Future<void> fetchAndSet() async {
    const url = 'https://api.spacexdata.com/v3/ships';
    try {
      final response = await http.get(url);
      final data = json.decode(response.body) as List<dynamic>;
      final ships = data
          .map((e) => Ship(
                id: e['ship_id'],
                name: e['ship_name'],
                type: e['ship_type'],
                imageUrl: e['image'],
                homePort: e['home_port'],
                yearBuilt: e['year_built'],
                active: e['active'],
              ))
          .toList();
      _items = ships;
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
    print('...');
  }
}
