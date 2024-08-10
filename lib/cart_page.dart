import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:shop_app/card_provider.dart';

import 'package:provider/provider.dart';
=======
import 'package:shop_app/global_variable.dart';
>>>>>>> b698d17 ( Bottom Navigation created)

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final data = (Provider.of<CardProvider>(context).cart);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Cart')),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final cartData = data[index];
            return ListTile(
              leading: CircleAvatar(
                child: Image(image: AssetImage(cartData['imageUrl'] as String)),
              ),
              title: Text(
                '${cartData['title']} ${cartData['company']}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text('Size : ${cartData['size']}'),
              trailing: IconButton(
                onPressed: () {

showDialog(context: context, builder: (context){
  return   AlertDialog.adaptive(
    title: const Text(" Delete Item"),
    content: const Text(" Do You really want to delet this item"),
    actions: [
      TextButton(
    onPressed: () {
                              Provider.of<CardProvider>(context, listen: false)
                                  .removeProduct(cartData);
                              Navigator.of(context).pop();
                            },
      child: const Text( " Yes")),
      TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text( " No")),
    ],

  );
});

                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            );
          }),
    );
  }
}
=======
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Cart')),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        
        itemBuilder:   (context, index){
          final cartData = cart[index];
        return ListTile(
          leading: CircleAvatar(child: Image(image: AssetImage(
            cartData['imageUrl'] as String
          ))
          ,),
          title: Text('${cartData['title']} ${cartData['company']}', style: Theme.of(context).textTheme.titleMedium, ),
          subtitle: Text('Size : ${cartData['size']}'),
          trailing:   IconButton(onPressed:(){} , icon: Icon(Icons.delete, color: Colors.red,),),
        );

      }),
    );
  }
}
>>>>>>> b698d17 ( Bottom Navigation created)
