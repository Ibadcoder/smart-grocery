import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/app_top_bar.dart';
import '../widgets/bordered_card.dart';

class RemindersNotificationsScreen extends StatelessWidget {
  const RemindersNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppTopBar(onBack: () => Navigator.of(context).maybePop()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.marginMobile,
          vertical: AppSpacing.marginMobile,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Stay updated with your grocery habits.',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Mark all as read',
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.base),
            _buildNotificationCard(
              context,
              icon: Icons.shopping_cart,
              iconBgColor: colorScheme.primaryContainer,
              iconColor: colorScheme.primary,
              title: 'Time to buy milk',
              time: '2h ago',
              description:
                  "Based on your history, you're likely running low on 2% Dairy Milk. Add it to your list?",
             
              actions: MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: MediaQuery.textScalerOf(
                    context,
                  ).clamp(maxScaleFactor: 1.05),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          elevation: 0,
                   
                          textStyle: textTheme.labelMedium,
                          minimumSize: const Size(0, 40),
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: AppSpacing.base,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Add to list', maxLines: 1),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.surfaceContainer,
                        foregroundColor: colorScheme.onSurfaceVariant,
                        elevation: 0,
                    
                        textStyle: textTheme.labelMedium,
                        minimumSize: const Size(0, 40),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm,
                          vertical: AppSpacing.base,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Dismiss', maxLines: 1),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildNotificationCard(
              context,
              icon: Icons.warning,
              iconBgColor: colorScheme.errorContainer,
              iconColor: colorScheme.error,
              title: 'Budget limit reached',
              time: '5h ago',
              description:
                  "You've reached 90% of your weekly grocery budget (\$180.00).",
              actions: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLow,
                  borderRadius: AppRadius.sm,
                ),
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.error,
                      borderRadius: AppRadius.sm,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.marginMobile),
            Text(
              'Earlier',
              style: textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildEarlierItem(
              context,
              icon: Icons.sell,
              iconColor: colorScheme.secondary,
              iconBg: colorScheme.secondaryContainer,
              title: 'Price Drop: Organic Eggs',
              time: 'Yesterday',
              desc: 'Price fell from \$5.99 to \$4.49 at FreshMart.',
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildEarlierItem(
              context,
              icon: Icons.analytics,
              iconColor: colorScheme.primary,
              iconBg: colorScheme.primaryContainer,
              title: 'Your Weekly Insights',
              time: '2 days ago',
              desc: 'You saved \$24.00 this week using smart lists!',
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildEarlierItem(
              context,
              icon: Icons.person,
              iconColor: colorScheme.onSurfaceVariant,
              iconBg: colorScheme.surfaceContainer,
              title: 'Profile verified',
              time: '3 days ago',
              desc: 'Your account security has been updated.',
            ),
            const SizedBox(height: AppSpacing.marginMobile),

            // Promo Card
           
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 200),
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  const Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.lg,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/reminders_promo.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.lg,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.7),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.marginMobile),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Unlock Smart Reminders',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        const Text(
                          'Let AI track your pantry so you never run out of essentials.',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.surfaceContainerLowest,
                            foregroundColor: colorScheme.primary,
                            textStyle: textTheme.labelMedium,
                            minimumSize: const Size(0, 40),
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.base,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Try Premium'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.base),
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

  Widget _buildNotificationCard(
    BuildContext context, {

    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String time,
    required String description,
    required Widget actions,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BorderedCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      time,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.base),
                Text(
                  description,
                  style: textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                actions,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEarlierItem(
    BuildContext context, {

    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String time,
    required String desc,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest.withValues(alpha: 0.6),
        borderRadius: AppRadius.md,
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.base),
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      time,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  desc,
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 13,
                    color: colorScheme.onSurfaceVariant,
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
