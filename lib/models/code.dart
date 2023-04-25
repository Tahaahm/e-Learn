// ignore_for_file: unnecessary_this, unused_field, unnecessary_new

class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _productt;
  List<ProductModel> get product => _productt;

  Product(
      {required totalSize,
      required typeId,
      required offset,
      required productt}) {
    this._totalSize = totalSize;
    this._offset = offset;
    this._productt = productt;
    this._productt = productt;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['productt'] != null) {
      _productt = <ProductModel>[];
      json['productt'].forEach((v) {
        _productt.add(new ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  String? title1;
  String? image;
  String? img;
  String? price;
  String? title;
  String? name;
  int? videos;
  String? imgl;

  ProductModel(
      {this.title1,
      this.image,
      this.img,
      this.price,
      this.title,
      this.name,
      this.videos,
      this.imgl});

  ProductModel.fromJson(Map<String, dynamic> json) {
    title1 = json['title1'];
    image = json['image'];
    img = json['img'];
    price = json['price'];
    title = json['title'];
    name = json['name'];
    videos = json['videos'];
    imgl = json['imgl'];
  }
}
