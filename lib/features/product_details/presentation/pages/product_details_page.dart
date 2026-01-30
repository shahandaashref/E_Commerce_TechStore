import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/core/widgets/custom_bottom.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/product_image_widget.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/product_info_widget.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/reviews.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    final String imageUrl = args[0];
    final String name = args[1];
    final double price = args[2];
    // final String description = args['description'];
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    // final colorScheme = theme.colorScheme;
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(localizations!.productdetails),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            productImageInDetails(imageUrl),
            SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(name, style: textTheme.displayMedium),
                  SizedBox(height: 8),
                  // Product Price
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: textTheme.bodyMedium?.copyWith(
                      color: ECommerceAppTheme.textPrimary,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Product Description
                  Text(
                    'This is a detailed description of the product. It highlights features, specifications, and other relevant information that helps the customer make an informed decision.',
                    style: textTheme.bodyMedium,
                  ),
                  //taple
                  featureTable(),
                  //reviews
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Text(
                        localizations.reviews,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          //todo:icon tap
                        },
                        icon: Icon(Icons.arrow_drop_up_rounded),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ReviewsListViewInProductDetails(textTheme: textTheme),
                  //add review button
                  SizedBox(height: 16),
                   CustomBottom(
                    text: localizations.viewAllReviews, 
                    onPressed: () {
                      //todo:view all reviews
                    }
                    ),

                  SizedBox(height: 24),
                  // Add to Cart and Buy Now Buttons
                Row(children: [
                  Expanded(
                    child: CustomBottom(
                      text: localizations.addToCart,
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                    ),
                    ),
                  SizedBox(width: 16),  
                  // Expanded(
                  //   child: CustomBottom(
                  //     text: localizations.buyNow,
                  //     onPressed: () {},
                  //   ),
                  // ),
                  //add to favorites button
                  IconButton(onPressed: (){
                    //todo: add to favorites
                  }, icon: Icon(Icons.favorite_border_outlined)
                  )
                ],
                ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}




//https://dummyjson.com/products/category/laptops