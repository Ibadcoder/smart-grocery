import 'package:flutter/material.dart';

import '../models/grocery_item.dart';
import '../theme/app_theme.dart';

class SmartChecklistScreen extends StatelessWidget {
  final VoidCallback onAddItem;

  const SmartChecklistScreen({super.key, required this.onAddItem});

  static const List<GroceryItem> _sampleItems = [
    GroceryItem(
      name: "Organic Spinach",
      quantity: "2 bunches",
      category: "Vegetables",
    ),
    GroceryItem(
      name: "Cherry Tomatoes",
      quantity: "1 pack",
      category: "Vegetables",
      checked: true,
    ),
    GroceryItem(name: "Whole Milk", quantity: "1 Gallon", category: "Dairy"),
    GroceryItem(name: "Salted Butter", quantity: "250g", category: "Dairy"),
    GroceryItem(
      name: "Tortilla Chips",
      quantity: "Large bag",
      category: "Snacks",
    ),
  ];

  List<Widget> _buildItems(String category) {
    return [
      for (final item in _sampleItems.where((i) => i.category == category))
        GroceryListItem(
          title: item.name,
          subtitle: item.quantity,
          isChecked: item.checked,

          showStepper: item.name == "Organic Spinach",
          quantity: 2,
          onCheckedChange: () {},
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: onAddItem,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.lg),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 128.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.lg),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.marginMobile,
              ),
              child: Text(
                "Frequently Bought",
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.marginMobile,
              ),
              child: Row(
                children: const [
                  FrequentlyBoughtChip(text: "Almond Milk"),
                  SizedBox(width: AppSpacing.sm),
                  FrequentlyBoughtChip(text: "Avocados"),
                  SizedBox(width: AppSpacing.sm),
                  FrequentlyBoughtChip(text: "Greek Yogurt"),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            // Lists
            CategorySection(
              categoryName: "Vegetables",
              items: _buildItems("Vegetables"),
            ),

            const SizedBox(height: AppSpacing.xl),

            CategorySection(categoryName: "Dairy", items: _buildItems("Dairy")),

            const SizedBox(height: AppSpacing.xl),

            CategorySection(
              categoryName: "Snacks",
              items: _buildItems("Snacks"),
            ),

            const SizedBox(height: AppSpacing.xl),

            // Empty State / Ready to shop
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 128,
                      height: 128,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest.withValues(
                          alpha: 0.5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.shopping_basket,
                        color: colorScheme.primary.withValues(alpha: 0.5),
                        size: 48,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      "Ready to shop?",
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FrequentlyBoughtChip extends StatelessWidget {
  final String text;

  const FrequentlyBoughtChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999.0),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: InkWell(
        onTap: () {
          // Add item logic
        },
        borderRadius: BorderRadius.circular(999.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            children: [
              Icon(
                Icons.add,
                size: 20,
                color: colorScheme.onSecondaryContainer,
              ),
              const SizedBox(width: AppSpacing.base),
              Text(
                text,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String categoryName;
  final List<Widget> items;

  const CategorySection({
    super.key,
    required this.categoryName,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.marginMobile),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: AppRadius.standard,
                ),
                child: Text(
                  categoryName,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Container(
                  height: 1,
                  color: colorScheme.surfaceContainerHighest,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          // Using spread operator to list items with spacing
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: item,
            ),
          ),
        ],
      ),
    );
  }
}

class GroceryListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isChecked;
  final VoidCallback onCheckedChange;
  final bool showStepper;
  final int quantity;

  const GroceryListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isChecked,
    required this.onCheckedChange,
    this.showStepper = false,
    this.quantity = 1,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);

    final containerColor = isChecked
        ? colorScheme.primaryContainer.withValues(alpha: 0.2)
        : colorScheme.surface; // Equivalent to surfaceContainerLowest

    return Card(
      elevation: isChecked ? 0 : 1,
      color: containerColor,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
      child: InkWell(
        onTap: onCheckedChange,
        borderRadius: AppRadius.md,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              // Custom Checkbox
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: isChecked ? colorScheme.primary : Colors.transparent,
                  borderRadius: AppRadius.sm,
                  border: Border.all(
                    color: isChecked ? Colors.transparent : colorScheme.primary,
                    width: 2.0,
                  ),
                ),
                alignment: Alignment.center,
                child: isChecked
                    ? Icon(Icons.check, color: colorScheme.onPrimary, size: 20)
                    : null,
              ),
              const SizedBox(width: AppSpacing.md),

              // Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        decoration: isChecked
                            ? TextDecoration.lineThrough
                            : null,
                        color: isChecked
                            ? colorScheme.onSurfaceVariant
                            : colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),

              // Trailing Action (Stepper or More icon)
              if (showStepper && !isChecked)
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                    borderRadius: AppRadius.standard,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {}, // Decrease quantity
                        icon: Icon(Icons.remove, color: colorScheme.primary),
                        iconSize: 20,
                        visualDensity: VisualDensity.compact,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.base,
                        ),
                        child: Text(
                          '$quantity',
                          style: theme.textTheme.labelMedium,
                        ),
                      ),
                      IconButton(
                        onPressed: () {}, // Increase quantity
                        icon: Icon(Icons.add, color: colorScheme.primary),
                        iconSize: 20,
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),
                )
              else
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                  color: colorScheme.onSurfaceVariant,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
