import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:andasia/catalog/product_list/widgets/widgets.dart';
import 'package:andasia/repositories/products/products.dart';




class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  List<Product>? _productsList;
  List<Section>? _sectionsList;
  final _productsRepository = ProductsRepository(dio: Dio());

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final (products, sections) = await _productsRepository.getProductsList();

    _productsList = products;
    _sectionsList = sections;

    setState(() {});
  }

  void _menuOpen() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Меню'),
            ),
            body: Row(
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                }, child: Text('На главную')),
                Padding(padding: EdgeInsets.only(left: 15)),
                Text('Наше простое меню')
              ],
            ),
          );
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_outlined),
            onPressed: _menuOpen,
          ),
        ],
      ),
      body: (_productsList == null || _sectionsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Блок категорий
          Text(
            'Категории',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _sectionsList!.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final section = _sectionsList![i];
                return ElevatedButton(
                  onPressed: () {
                    // например, фильтрация товаров по категории
                    print('Выбрана категория: ${section.name}');
                    print('SECTIONS: $_sectionsList');
                  },
                  child: Text(section.name),
                );
              },
            ),
          ),

          const SizedBox(height: 16),
          Text(
            'Товары',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),

          // Список товаров
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _productsList!.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, i) {
              final product = _productsList![i];
              return ProductTile(product: product);
            },
          ),
        ],
      ),
    );
  }
}

