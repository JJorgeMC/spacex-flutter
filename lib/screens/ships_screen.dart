import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_app/providers/ships.dart';
import 'package:spacex_app/widgets/ship_item.dart';

class ShipsScreen extends StatelessWidget {
  const ShipsScreen({Key key}) : super(key: key);

  Future<void> _refreshShips(BuildContext context) {
    return Provider.of<Ships>(context, listen: false).fetchAndSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ships'),
      ),
      body: FutureBuilder(
        future: _refreshShips(context),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<Ships>(
                builder: (ctx, ships, _) => GridView(
                  addAutomaticKeepAlives: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  children: ships.items
                      .map((e) => ShipItem(name: e.name, imageUrl: e.imageUrl))
                      .toList(),
                ),
              ),
      ),
    );
  }
}
