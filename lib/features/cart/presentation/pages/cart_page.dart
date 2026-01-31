import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/widgets/custom_bottom.dart';
import 'package:e_commerce/features/cart/logic/cart_provider.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:e_commerce/core/theme/app_theme.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
       
        final cartItems = cart.items.values.toList();
        final cartKeys = cart.items.keys.toList(); 

        return Scaffold(
          appBar: AppBar(
             leading: const BackButton(), 
            title: Text(context.loc.cart),
            actions: [
               
               if(cartItems.isNotEmpty)
               IconButton(
                 icon: const Icon(Icons.delete_forever),
                 onPressed: () => cart.clearCart(),
               )
            ],
          ),
          body: cartItems.isEmpty
              ? _buildEmptyCart() 
              : Column(
                  children: [
                   
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          final productId = cartKeys[index];

                          return CartItemWidget(
                            imageUrl: item.image,
                            title: item.title,
                            price: item.price,
                            quantity: item.quantity,
                            // ربط الدوال بالبروفيدر
                            onIncrement: () => cart.incrementQuantity(productId),
                            onDecrement: () => cart.decrementQuantity(productId),
                            onRemove: () => cart.removeFromCart(productId),
                          );
                        },
                      ),
                    ),

                    
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: ECommerceAppTheme.surface,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha:  0.1),
                            blurRadius: 10,
                            offset: const Offset(0, -5),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "\$${cart.totalAmount.toStringAsFixed(2)}",
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          
                          
                          CustomBottom(
                            onPressed: () {
                              // todo: navigate to checkout
                            },
                            text: context.loc.proceedcheckout,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey.withOpacity(0.5)),
          const SizedBox(height: 20),
          Text(
            "Your Cart is Empty",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}