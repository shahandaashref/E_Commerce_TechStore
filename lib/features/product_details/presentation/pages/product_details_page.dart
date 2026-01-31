import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/core/widgets/custom_bottom.dart';
import 'package:e_commerce/features/cart/logic/cart_provider.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/product_image_widget.dart';
// import 'package:e_commerce/features/product_details/presentation/widgets/product_info_widget.dart'; // لو مش مستخدمه ممكن تشيله
import 'package:e_commerce/features/product_details/presentation/widgets/reviews.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as dynamic;
    final String imageUrl = product.image ?? '';
    final String name = product.title ?? 'No Name';
    final double price = (product.price ?? 0).toDouble();
    final String description = product.description ?? 'No Description';
    
    // final List reviews = product.reviews ?? [];

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(localizations!.productdetails),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            productImageInDetails(imageUrl), 
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(name, style: textTheme.displayMedium),
                  const SizedBox(height: 8),
                  
                  // Product Price
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: textTheme.bodyMedium?.copyWith(
                      color: ECommerceAppTheme.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  
                  Text(
                    description,
                    style: textTheme.bodyMedium,
                  ),
                  
                  // const SizedBox(height: 16),
                  // featureTable(), 

                  const SizedBox(height: 24),
                  
                  // Reviews Header
                  Row(
                    children: [
                      Text(
                        localizations.reviews,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_drop_up_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                
                  // ReviewsListViewInProductDetails(
                  //   textTheme: textTheme,
                  //   reviews: reviews, 
                  // ),

                  const SizedBox(height: 16),
                  CustomBottom(
                    text: localizations.viewAllReviews,
                    onPressed: () {},
                  ),

                  const SizedBox(height: 24),
                  // Add to Cart and Favorite Buttons
                  Row(
                    children: [
                      Expanded(
                        child: CustomBottom(
                          text: localizations.addToCart,
                          onPressed: () {
                            context.read<CartProvider>().addToCart(
                                  product.id.toString(),
                                  product.price.toDouble(), 
                                  product.title, 
                                  product.image, 
                                );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${product.title} added to cart!'),
                                backgroundColor: Colors.green,
                                duration: const Duration(seconds: 1),
                              ),
                            );
                            
                          Navigator.pushNamed(context, '/cart');
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () {
                          // todo: add to favorites
                        },
                        icon: const Icon(Icons.favorite_border_outlined),
                      )
                    ],
                  ),
                   const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}