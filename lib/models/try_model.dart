// ignore_for_file: unnecessary_this, unused_field, unnecessary_new

class ProductTry {
  int? _offset;
  int? _typeId;
  int? _totalSize;
  late List<ProductModelTry> _product;
  List<ProductModelTry> get product => _product;

  ProductTry(
      {required offset,
      required typeId,
      required totalSize,
      required product}) {
    this._offset = offset;
    this._product = product;
    this._totalSize = totalSize;
    this._typeId = typeId;
  }

  ProductTry.fromJson(Map<String, dynamic> json) {
    _offset = json['offset'];
    _typeId = json['type_id'];
    _totalSize = json['total_size'];
    if (json['product'] != null) {
      _product = <ProductModelTry>[];
      json['product'].forEach((v) {
        _product.add(new ProductModelTry.fromJson(v));
      });
    }
  }
}

class ProductModelTry {
  int? id;
  String? name;
  String? icon;
  String? rating;
  List<Categories>? categories;

  ProductModelTry(
      {this.id, this.name, this.icon, this.rating, this.categories});

  ProductModelTry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    rating = json['rating'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }
}

class Categories {
  int? id;
  String? videos;
  String? rating;
  String? price;
  String? title;
  String? name;
  String? img;
  int? numberImage;

  Categories(
      {this.id,
      this.videos,
      this.rating,
      this.price,
      this.title,
      this.name,
      this.img,
      this.numberImage});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videos = json['videos'];
    rating = json['rating'];
    price = json['price'];
    title = json['title'];
    name = json['name'];
    img = json['img'];
    numberImage = json['number_image'];
  }
}
