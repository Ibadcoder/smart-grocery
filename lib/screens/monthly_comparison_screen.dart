import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/app_top_bar.dart';

class MonthlyComparisonScreen extends StatelessWidget {
  const MonthlyComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(onBack: () => Navigator.of(context).maybePop()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: AppSpacing.marginMobile,
          right: AppSpacing.marginMobile,
          top: 16,
          bottom: AppSpacing.marginMobile,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: AppSpacing.lg),
            _buildTotalSpendingCard(context),
            const SizedBox(height: AppSpacing.lg),
            _buildSignificantChanges(context),
            const SizedBox(height: AppSpacing.lg),
            _buildCategorySpending(context),
            const SizedBox(height: AppSpacing.lg),
            _buildBudgetTip(context),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: 3,
        onDestinationSelected: (index) =>
            handleShellNavFromDetail(context, index),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              "Comparison",
              style: textTheme.displayLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Container(
          padding: const EdgeInsets.all(AppSpacing.xs),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(99),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: AppSpacing.base,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(99),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  "Sep vs Oct",
                  style: textTheme.labelMedium?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: AppSpacing.base,
                ),
                child: Text(
                  "Custom",
                  style: textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTotalSpendingCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      color: colorScheme.surfaceContainerLowest,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Spending Increase",
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.base),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$412.50",
                  style: textTheme.displayLarge?.copyWith(
                    fontSize: 36,
                    color: colorScheme.onSurface,
                    height: 1.1,
                  ),
                ),
                const SizedBox(width: AppSpacing.base),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      Icon(
                        Icons.trending_up,
                        color: colorScheme.error,
                        size: 18,
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Text(
                        "12%",
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.error,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: AppRadius.sm,
              child: SizedBox(
                height: 8,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(color: colorScheme.primaryContainer),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(color: colorScheme.primary),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.base),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sep (\$368.00)",
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  "Oct (\$412.50)",
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignificantChanges(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Significant Changes",
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        _buildChangeItem(
          context,
          icon: Icons.egg_outlined,
          iconBgColor: const Color(0xFFFFF7ED),
          iconColor: const Color(0xFFEA580C),
          title: "Organic Eggs (Doz)",
          subtitle: "Price volatility alert",
          changeAmount: "+\$1.25",
          changeIcon: Icons.arrow_upward,
          changeColor: colorScheme.error,
          priceDesc: "\$4.50 → \$5.75",
        ),
        const SizedBox(height: AppSpacing.sm),
        _buildChangeItem(
          context,
          icon: Icons.eco_outlined,
          iconBgColor: const Color(0xFFECFDF5),
          iconColor: const Color(0xFF059669),
          title: "Hass Avocados",
          subtitle: "Seasonal savings",
          changeAmount: "-\$0.80",
          changeIcon: Icons.arrow_downward,
          changeColor: colorScheme.primary,
          priceDesc: "\$2.30 → \$1.50",
        ),
      ],
    );
  }

  Widget _buildChangeItem(
    BuildContext context, {
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String changeAmount,
    required IconData changeIcon,
    required Color changeColor,
    required String priceDesc,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 1,
      shadowColor: Colors.black.withValues(alpha: 0.05),
      color: colorScheme.surfaceContainerLowest,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: AppRadius.standard,
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(changeIcon, color: changeColor, size: 16),
                    Text(
                      changeAmount,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: changeColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  priceDesc,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySpending(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Category Spending",
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            Icon(Icons.info_outline, color: colorScheme.onSurfaceVariant),
          ],
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 1,
          shadowColor: Colors.black.withValues(alpha: 0.05),
          color: colorScheme.surfaceContainerLowest,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.lg),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                _buildCategoryBarItem(
                  context,
                  "Produce",
                  "\$112 vs \$145",
                  0.75,
                  0.85,
                ),
                const SizedBox(height: AppSpacing.marginMobile),
                _buildCategoryBarItem(
                  context,
                  "Dairy & Meat",
                  "\$140 vs \$132",
                  0.90,
                  0.80,
                ),
                const SizedBox(height: AppSpacing.marginMobile),
                _buildCategoryBarItem(
                  context,
                  "Pantry Essentials",
                  "\$85 vs \$92",
                  0.60,
                  0.70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  child: Divider(color: colorScheme.surfaceContainer),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorScheme.secondaryContainer.withValues(
                              alpha: 0.4,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.base),
                        Text(
                          "September",
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: AppSpacing.marginMobile),
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorScheme.primaryContainer,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.base),
                        Text(
                          "October",
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryBarItem(
    BuildContext context,
    String title,
    String value,
    double prevRatio,
    double currRatio,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              value,
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.base),
        Container(
          height: 24,
          width: double.infinity,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainer,
            borderRadius: AppRadius.md,
          ),
          child: Stack(
            children: [
              FractionallySizedBox(
                widthFactor: prevRatio,
                child: Container(
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer.withValues(
                      alpha: 0.4,
                    ),
                    borderRadius: AppRadius.md,
                  ),
                ),
              ),
              FractionallySizedBox(
                widthFactor: currRatio,
                child: Container(
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: AppRadius.md,
                    border: Border.all(
                      color: colorScheme.surfaceContainerLowest,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBudgetTip(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer.withValues(alpha: 0.2),
        borderRadius: AppRadius.lg,
        border: Border.all(
          color: colorScheme.secondaryContainer.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_outline, color: colorScheme.secondary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Budget Tip",
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  "Your spending in \"Produce\" increased by 29%. This is largely due to higher seasonal fruit prices. Switching to frozen berries could save you ~\$15/month.",
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
