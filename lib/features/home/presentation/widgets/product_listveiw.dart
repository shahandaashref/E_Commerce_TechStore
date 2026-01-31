import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProductListViewBestSallers extends StatefulWidget {
  const ProductListViewBestSallers({super.key, required this.theme, required this.products});

  final ThemeData theme;
  final List<dynamic> products;

  @override
  State<ProductListViewBestSallers> createState() => _ProductListViewBestSallersState();
}

class _ProductListViewBestSallersState extends State<ProductListViewBestSallers> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          // final imageUrl = popularProducts[index].imageUrl;
          // final name = popularProducts[index].name;
          // final price = popularProducts[index].price;

          return InkWell(
            onTap: () {
              //todo: implement product details navigation
              Navigator.pushNamed(
                context,
                '/productDetails',
                arguments: widget.products[index],
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              width: 150,

              decoration: BoxDecoration(
                color: ECommerceAppTheme.surface,
                borderRadius: BorderRadius.circular(ECommerceAppTheme.radiusMd),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(ECommerceAppTheme.radiusMd),
                        topRight: Radius.circular(ECommerceAppTheme.radiusMd),
                      ),
                    ),
                    child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(ECommerceAppTheme.radiusMd),
                      topRight: Radius.circular(ECommerceAppTheme.radiusMd),
                    ),
                    child: Image.network(
                      widget.products[index].image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error); 
                      },
                    ),
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ECommerceAppTheme.sm,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.products[index].title,
                          style: widget.theme.textTheme.bodyMedium?.copyWith(
                            color: ECommerceAppTheme.textPrimary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        //star rating
                        //todo: implement star rating
                        SizedBox(height: 5),
                        Text('\$${widget.products[index].price.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}