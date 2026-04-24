import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:andasia/repositories/products/models/product.dart';
import 'package:andasia/router/router.dart';


class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      //leading: Image.network(product.imageUrl),
      title: Text(
        product.name,
        style: theme.textTheme.bodyMedium,
      ),
      /*subtitle: Text(
        '${product.price} \$',
        style: theme.textTheme.labelSmall,
      ),*/
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/products-item',
          arguments: product,
        );
      },
    );
  }
}