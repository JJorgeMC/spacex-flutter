import 'package:flutter/foundation.dart';

class Ship {
  final String id;
  final String name;
  final String type;
  final String imageUrl;
  final String homePort;
  final int yearBuilt;
  final bool active;

  const Ship({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.imageUrl,
    @required this.homePort,
    @required this.yearBuilt,
    @required this.active,
  });
}
