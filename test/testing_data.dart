import 'package:route_tech_summit_flutter_task/products/domain/entities/product_entity.dart';

class TestingData {
  static const List<ProductEntity> products = [
    ProductEntity(
      id: 1,
      title: 'Cupcake',
      description: 'Description 1',
      category: 'Category 1',
      price: 100,
      rating: RatingEntity(rate: 4.0, count: 100),
      image: 'image1.png',
    ),
    ProductEntity(
      id: 2,
      title: 'Car',
      description: 'Description 2',
      category: 'Category 2',
      price: 200,
      rating: RatingEntity(rate: 3.5, count: 200),
      image: 'image2.png',
    ),
    ProductEntity(
      id: 3,
      title: 'Phone',
      description: 'Description 3',
      category: 'Category 3',
      price: 300,
      rating: RatingEntity(rate: 4.5, count: 300),
      image: 'image3.png',
    ),
  ];
}
