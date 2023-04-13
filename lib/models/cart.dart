class CartItem {
  int? id;
  String? name;
  double? price;
  int? qty;
  String? kategori;
  bool? isChecked;

  CartItem({
    required this.id, 
    required this.name, 
    required this.price, 
    required this.qty,
    required this.kategori,
    required this.isChecked});
}