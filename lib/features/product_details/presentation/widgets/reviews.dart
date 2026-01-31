import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ReviewsListViewInProductDetails extends StatelessWidget {
  const ReviewsListViewInProductDetails({
    super.key, 
    required this.textTheme,
    required this.reviews,
  });

  final TextTheme textTheme;
  final List reviews; 

  @override
  Widget build(BuildContext context) {
    
    if (reviews.isEmpty) {
      return const Center(child: Text("No reviews yet"));
    }

    return SizedBox(
      
      child: ListView.builder(
       
        itemCount: reviews.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), 
        itemBuilder: (context, index) {
          final review = reviews[index]; 

          return Container(
            margin: const EdgeInsets.only(bottom: ECommerceAppTheme.radiusMd),
            padding: const EdgeInsets.all(ECommerceAppTheme.sm),
            decoration: BoxDecoration(
              color: ECommerceAppTheme.surface,
              borderRadius: BorderRadius.circular(ECommerceAppTheme.radiusMd),
              border: Border.all(color: ECommerceAppTheme.border),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: ECommerceAppTheme.primary,
                child: Icon(Icons.person, color: Colors.white),
              ),
              
              title: Text(review['reviewerName'] ?? 'Anonymous'),
              
              
              trailing: Text(
                '${review['rating']}/5', 
                style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)
              ),
              
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Row(
                    children: List.generate(5, (starIndex) {
                      final int rating = (review['rating'] ?? 0).toInt();
                      return Icon(
                        starIndex < rating ? Icons.star : Icons.star_border,
                        color: ECommerceAppTheme.warning,
                        size: 16,
                      );
                    }),
                  ),
                  const SizedBox(height: 4),
                  
                  
                  Text(
                    review['comment'] ?? '',
                    style: textTheme.bodyMedium,
                    // maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                  ),
                  
                  
                  if (review['date'] != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                         review['date'].toString().split('T')[0], 
                         style: textTheme.bodySmall?.copyWith(color: Colors.grey),
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