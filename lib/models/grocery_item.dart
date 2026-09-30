class GroceryItem {
  final String name;

  final String quantity;

  final String category;

  final bool checked;

  const GroceryItem({
    required this.name,
    required this.quantity,
    required this.category,
    this.checked = false,
  });
}
