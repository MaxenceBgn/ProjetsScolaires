import 'package:emarket/models/providers/cartprovider.dart';
import 'package:emarket/screens/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:emarket/models/product.dart';
import 'package:provider/provider.dart';

CartProvider createProvider() => CartProvider();

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ProductListPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProductListPage> {
  List<Product> productList = [];
  int selectedTileIndex = -1;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    productList = await Product.fetchProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return ChangeNotifierProvider(
        create: (_) => createProvider(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedTileIndex = index;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                  product: productList[index]),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Image.network(
                            productList[index].images[0],
                            width: 40,
                            height: 40,
                          ),
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(productList[index].title),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_shopping_cart),
                                onPressed: () {
                                  cartProvider.addToCart(productList[index]);
                                  setState(() {
                                    selectedTileIndex = index;
                                  });
                                },
                              ),
                            ],
                          ),
                          tileColor: index == selectedTileIndex
                              ? Colors.blue.withOpacity(0.2)
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
