import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ReviewsListViewInProductDetails extends StatelessWidget {
  const ReviewsListViewInProductDetails({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: ECommerceAppTheme.radiusMd),
            padding: EdgeInsets.all(ECommerceAppTheme.sm),
            decoration: BoxDecoration(
              color: ECommerceAppTheme.surface,
              borderRadius: BorderRadius.circular(ECommerceAppTheme.radiusMd),
              border: Border.all(color: ECommerceAppTheme.border),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: ECommerceAppTheme.primary,
                child: Icon(Icons.person),
              ),
              //to do: dynamic user name
              title: Text('User'),
              trailing: Text('5/5', style: textTheme.bodyMedium),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(5, (starIndex) {
                      //to fix starIndex being final
                      //todo: find a better way
                      starIndex = 2;
                      return Icon(
                        starIndex < 4 ? Icons.star : Icons.star_border,
                        color: ECommerceAppTheme.warning,
                        size: 16,
                      );
                    }),
                  ),
                  SizedBox(height: 4),
                  Text(
                    //todo: dynamic comment
                    'This is a review comment from user ${index + 1}.',
                    style: textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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