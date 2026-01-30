
class CategoryModel {
  
  final String id;
  final String title;
  final String images;

  CategoryModel({
    required this.id,
    required this.title,
    required this.images,
  });
  static Map<String, dynamic> toJson(CategoryModel category) {
    return {
      'id': category.id,
      'title': category.title,
      'images': category.images,
    };
  }
  static CategoryModel fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      title: json['title'] as String,
      images: json['images'] as String,
    );
  }

}