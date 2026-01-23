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
    name: 'Wireless Headphones',
    imageUrl: 'assets/images/headphones-with-minimalist-monochrome-background.jpg',
    price: 59.99,
  ),
  ProductItem(
    name: 'Smart Watch',
    imageUrl: 'assets/images/phone.jpg',
    price: 129.99,
  ),
  ProductItem(
    name: 'Gaming Mouse',
    imageUrl: 'assets/images/headphones.jpg',
    price: 39.99,
  ),
  ProductItem(
    name: '4K Monitor',
    imageUrl: 'assets/images/laptop.jpg',
    price: 399.99,
  ),
];