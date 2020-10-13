import 'package:flutter/material.dart';

class ShipItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const ShipItem({@required this.name, @required this.imageUrl, key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final assetImage = AssetImage('assets/images/image-placeholder.png');
    return GridTile(
      child: FadeInImage(
        placeholder: assetImage,
        image: imageUrl == null ? assetImage : NetworkImage(imageUrl),
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black87.withOpacity(0.6),
        title: Text(
          name,
          style: Theme.of(context).textTheme.headline6,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
