import 'package:e_commerce/core/providers/product_provider.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/home/presentation/widgets/banner_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/category_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_listveiw.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductProvider>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context);
    return Scaffold(
      body: bodyHome(localization, context, theme),
    );
  }

  Consumer<ProductProvider> bodyHome(AppLocalizations? localization, BuildContext context, ThemeData theme) {
    return Consumer<ProductProvider>(
      builder: (BuildContext context, value, Widget? child) 
      {
        if (value.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (value.errorMessage.isNotEmpty) {
          return Center(
            child: Text('Error: ${value.errorMessage}'),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(ECommerceAppTheme.md),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homeHeader(localization, context),
                  BannerInHomePage(),
                  SizedBox(height: 20),
                  CategoriesGridView(),
                  SizedBox(height: 20),
                  bestSellers(localization, theme),
                  SizedBox(height: 10),
                  ProductListViewBestSallers(products: value.products, theme: theme),
                ],
              ),
            ),
          );
        }
        
      },
      
    );
  }

  /////////////////////////////////////////////////////////////////
  ///widgets for home page
  /////////////////////////////////////////////////////////////////
  Row bestSellers(AppLocalizations? localization, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          localization!.bestSellers,
          style: theme.textTheme.headlineLarge?.copyWith(
            color: ECommerceAppTheme.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            localization.seeAll,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: ECommerceAppTheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  




  Column homeHeader(AppLocalizations? localization, BuildContext context) {
    return Column(
      children: [
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${localization!.welcomeBack}\n',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  TextSpan(
                    text: localization.discoverTechDeals,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Spacer(),

            tapIconHeaderHomepage(
              icon: Icon(Icons.notifications_none_outlined, size: 30),
              onPressed: () {
                //todo: implement notifications
              },
            ),
            SizedBox(width: 10),
            tapIconHeaderHomepage(
              icon: Icon(Icons.shopping_cart_outlined, size: 30),
              onPressed: () {
                //todo: implement cart
              },
            ),
          ],
        ),

        SizedBox(height: 20),
        CustomTextFormField(
          hintText: localization.searchHint,
          icon: Icon(Icons.search_outlined),
        ),
        SizedBox(height: 10),
        Divider(),
      ],
    );
  }

  IconButton tapIconHeaderHomepage({
    required Icon icon,
    required VoidCallback onPressed,
  }) => IconButton(onPressed: onPressed, icon: icon);
}



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
    imageUrl:
        'assets/images/headphones-with-minimalist-monochrome-background.jpg',
    price: 199.99,
  ),
];
