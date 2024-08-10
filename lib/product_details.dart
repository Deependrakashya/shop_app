import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/card_provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> productDetails;
  const ProductDetails({super.key, required this.productDetails});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
   
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'details',
          style: Theme.of(context).textTheme.bodySmall,
        )),
      ),
      body: Column(
        children: [
          Text(
            widget.productDetails['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              widget.productDetails['imageUrl'] as String,
              height: deviceHeight * .5,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(202, 227, 252, 1),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                )),
            child: Column(
              children: [
                Text(
                  '\$${widget.productDetails['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          (widget.productDetails['size'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.productDetails['size'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                              onTap: () => setState(() {
                                    selectedSize = size;
                                  }),
                              child: Chip(
                                label: Text(size.toString()),
                                backgroundColor: selectedSize == size
                                    ? Theme.of(context).colorScheme.primary
                                    : null,
                              )),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      if (selectedSize != 0) {
                        Provider.of<CardProvider>(context, listen: false)
                            .addProduct({
                          'id': widget.productDetails['id'],
                          'title': widget.productDetails['title'],
                          'price': widget.productDetails['price'],
                          'size': selectedSize,
                          'imageUrl': widget.productDetails['imageUrl'],
                          'company': widget.productDetails['company']
                        }
                        );
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product Added SuccessFully',style: TextStyle(color: Colors.black),),backgroundColor: Color.fromRGBO(228, 243, 16, 1)));

                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please Select a Size',style: TextStyle(color: Color.fromARGB(255, 248, 2, 2)),),backgroundColor: Color.fromRGBO(228, 243, 16, 1)));
                      }
                    },
                    child: const Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center icon and text
                      children: [
                        Icon(Icons.trolley, color: Colors.black), // Your icon
                        SizedBox(width: 10), // Space between icon and text
                        Text(
                          'Add To Cart',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
