
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    final localization = AppLocalizations.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ECommerceAppTheme.md),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              //header
              homeHeader(localization, context),
              SizedBox(height: 10),
              //banner
              bannerInHomePage(localization, theme),
              SizedBox(height: 20),
              //categories list
              categoriesGridView(localization, theme),
              //popular products list
              SizedBox(height: 20),
              bestSellers(localization, theme),
              productListViewBestSallers(theme),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
/////////////////////////////////////////////////////////////////
///widgets for home page
/////////////////////////////////////////////////////////////////
  Row bestSellers(AppLocalizations? localization, ThemeData theme) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(localization!.bestSellers, style: theme.textTheme.headlineLarge?.copyWith(
                      color: ECommerceAppTheme.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),),
                    TextButton(
                      onPressed: () {},
                      child: Text(localization.seeAll, style: theme.textTheme.bodyMedium?.copyWith(
                        color: ECommerceAppTheme.primary,
                      ),
                    ),
                    ),
                  ],
                );
  }

  SizedBox productListViewBestSallers(ThemeData theme) {
    return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: popularProducts.length,
                    itemBuilder: (context, index) {
                      final imageUrl=popularProducts[index].imageUrl;
                      final name=popularProducts[index].name;
                      final price=popularProducts[index].price;

                    return InkWell(

                      onTap: () {
                        //todo: implement product details navigation
                         Navigator.pushNamed(context, '/productDetails',
                         arguments:[
                          // {'imageUrl': imageUrl,
                          // 'name': name,
                          // 'price': price,}
                          imageUrl,
                          name,
                          price,
                            ]);
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
                                image: DecorationImage(
                                  image: AssetImage(imageUrl),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(ECommerceAppTheme.radiusMd),
                                  topRight: Radius.circular(ECommerceAppTheme.radiusMd),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal:  ECommerceAppTheme.sm),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(name, 
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: ECommerceAppTheme.textPrimary,
                                    
                                  ),maxLines: 2, overflow: TextOverflow.ellipsis,),
                                
                                //star rating
                              //todo: implement star rating
                              SizedBox(height: 5),
                              Text('\$${price.toStringAsFixed(2)}',),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },),
                );
  }

  Column categoriesGridView(AppLocalizations? localization, ThemeData theme) {
    return Column(
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(localization!.categories, style: theme.textTheme.headlineLarge?.copyWith(
                        color: ECommerceAppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),),
                      TextButton(
                        onPressed: () {},
                        child: Text(localization.seeAll, style: theme.textTheme.bodyMedium?.copyWith(
                          color: ECommerceAppTheme.primary,
                        ),
                      ),
                      ),
                    ],
                    ),
                    SizedBox(
                      height: 200,
                      child: GridView.builder(
                        itemCount: categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
                      mainAxisSpacing: 2,), 
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            //todo: implement category tap action
                          
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 80,
                            decoration: BoxDecoration(
                              color: ECommerceAppTheme.surface,
                              borderRadius: BorderRadius.circular(ECommerceAppTheme.radiusMd),
                            ),
                            child: Center(
                              child: Container(
                                height: 65,
                                width: 65,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    ECommerceAppTheme.primary.withValues(alpha:  0.1),
                                    ECommerceAppTheme.primary.withValues( alpha: 0.3),
                                  ],),
                                  borderRadius: BorderRadius.circular(ECommerceAppTheme.radiusMd),
                                ),
                                child: Column(
                                children: [
                                  categories.values.elementAt(index),
                                  Text(
                                  categories.keys.elementAt(index), 
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontSize: 9,
                                    color: ECommerceAppTheme.textSecondary,
                                  ),)
                                ],
                                ),
                              )),
                          ),
                        );
                      }
                      
                      ),
                    )
                  ]
                    
                );
  }

  Container bannerInHomePage(AppLocalizations? localization, ThemeData theme) {
    return Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(ECommerceAppTheme.radiusLg),
                  
                  ),
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ECommerceAppTheme.radiusLg),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          localization!.nowYearSale,
                          style: theme.textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            //todo: implement shop now action
                           },
                          
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                          ),
                          child: Text(localization.shopNow,style:theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ) ,),
                ),
              ],
            ),
          ),
                );
  }

  Column homeHeader(AppLocalizations? localization, BuildContext context) {
    return Column(
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(text: 
                    TextSpan(
                      children: [
                        TextSpan(
                          text:  '${localization!.welcomeBack}\n',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        TextSpan(
                          text: localization.discoverTechDeals,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),),
                    Spacer(),
                
                    tapIconHeaderHomepage(icon: Icon(Icons.notifications_none_outlined,size: 30,), onPressed: () {
                      //todo: implement notifications
                    }),
                    SizedBox(width: 10),
                    tapIconHeaderHomepage(icon: Icon(Icons.shopping_cart_outlined,size: 30,), onPressed: () {
                      //todo: implement cart
                    }),
                
                  ],
                
                ),

                SizedBox(height: 20),
            CustomTextFormField(hintText: localization.searchHint,icon: Icon(Icons.search_outlined), ),
            SizedBox(height: 10),
            Divider(),
              ],
            );
  }

  IconButton tapIconHeaderHomepage({required Icon icon, required VoidCallback onPressed}) => IconButton( onPressed: onPressed, icon: icon,);
}

Map<String, Icon> categories = {

  'Smarthphonse': Icon(Icons.phone_android_outlined),
  'laptops': Icon(Icons.laptop_mac_outlined),
  'Audio': Icon(Icons.headphones_outlined),
  'Wearables': Icon(Icons.watch_outlined),
  'Gamming': Icon(Icons.sports_esports_outlined),
  'Cameras': Icon(Icons.camera_alt_outlined),
  'Tablets': Icon(Icons.tablet_mac_outlined),
  "Accessories": Icon(Icons.cable_outlined),
};

//provide some spacing values

//product item model
class ProductItem {
  final String name;
  final String imageUrl;
  final double price;

  ProductItem({
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

List<ProductItem> popularProducts = [
  ProductItem(
    name: 'Smartphone XYZ',
    imageUrl: 'assets/images/phone.jpg',
    price: 699.99,
  ),
  ProductItem(
    name: 'Laptop ABC',
    imageUrl: 'assets/images/laptop.jpg',
    price: 1299.99,
  ),
  ProductItem(
    name: 'Wireless Headphones',
    imageUrl: 'assets/images/headphones-with-minimalist-monochrome-background.jpg',
    price: 199.99,
  ),
];