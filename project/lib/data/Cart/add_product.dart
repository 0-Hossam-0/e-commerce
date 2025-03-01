import 'package:hive/hive.dart';
import 'package:project/data/Cart/cart_hive.dart';

class CartBasket {
  final _boxName = "cartItems";

  void addProduct(Product product) async {
    var box = Hive.box<Product>(_boxName);
    await box.add(product);
  }

  Future<Box<Product>> get _box async => await Hive.openBox<Product>(_boxName);

  Future<List<Product>> getAll() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> deleteAll() async {
    var box = await _box;
    box.clear();
  }

  Future<void> deleteAt(int index) async {
    var box = await _box;
    box.deleteAt(index);
  }

// Future<void> updateProduct(int index, Product medic) async {
//     var box = await _box;

//     edit medic
//     todo: update medic
//     await box.putAt(index, medic);
//   }
}
