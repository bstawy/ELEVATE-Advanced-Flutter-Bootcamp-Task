import 'package:route_tech_summit_flutter_task/products/domain/entities/product_entity.dart';

class TestingData {
  static const List<ProductEntity> products = [
    ProductEntity(
      id: 1,
      title: 'Cupcake',
      description: 'Description 1',
      category: 'Category 1',
      price: 100,
      discountPercentage: 10,
      rating: 4.5,
      brand: 'Brand 1',
      images: ['image1.png'],
      thumbnail: 'thumbnail1.png',
    ),
    ProductEntity(
      id: 2,
      title: 'Car',
      description: 'Description 2',
      category: 'Category 2',
      price: 200,
      discountPercentage: 20,
      rating: 4.0,
      brand: 'Brand 2',
      images: ['image2.png'],
      thumbnail: 'thumbnail2.png',
    ),
    ProductEntity(
      id: 3,
      title: 'Phone',
      description: 'Description 3',
      category: 'Category 3',
      price: 300,
      discountPercentage: 30,
      rating: 4.0,
      brand: 'Brand 3',
      images: ['image3.png'],
      thumbnail: 'thumbnail3.png',
    ),
  ];
}
