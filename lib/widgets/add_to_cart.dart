import 'package:pegadaian_digital/core/store.dart';
import 'package:pegadaian_digital/models/cart.dart';
import 'package:pegadaian_digital/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({
    super.key,
    required this.catalog,
  });
  

  @override
  Widget build(BuildContext context) {
     VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) { 
        isInCart = isInCart.toggle();    
        AddMutation(item: catalog);
        }
      },
      style: ElevatedButton.styleFrom(
            backgroundColor: context.primaryColor),
      child: isInCart ? const Icon(Icons.done, color: Colors.white,) : "Tambahkan".text.white.make(),
    );
  }
}
