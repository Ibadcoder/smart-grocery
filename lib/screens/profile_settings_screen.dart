import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/bordered_card.dart';
import 'reminders_notifications_screen.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.marginMobile,
          vertical: AppSpacing.marginMobile,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar & Name
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.xs),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 44,
                    backgroundImage: AssetImage(
                      'assets/images/avatar_user.jpg',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.edit,
                    color: colorScheme.onPrimary,
                    size: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Alex Johnson',
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'alex.j@pantryapp.com',
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // App Preferences
            _buildSectionTitle(context, 'App Preferences'),
            const SizedBox(height: AppSpacing.sm),

            Material(
              color: colorScheme.surfaceContainerLowest,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: AppRadius.lg,
                side: BorderSide(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(AppSpacing.base),
                      decoration: BoxDecoration(
                        color: colorScheme.secondaryContainer,
                        borderRadius: AppRadius.standard,
                      ),
                      child: Icon(
                        Icons.dark_mode,
                        color: colorScheme.onSecondaryContainer,
                      ),
                    ),
                    title: Text(
                      'Dark Mode',
                      style: textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Switch(
                      value: _isDarkMode,
                      onChanged: (val) {
                        setState(() {
                          _isDarkMode = val;
                        });
                      },
                      activeThumbColor: colorScheme.primary,
                    ),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(AppSpacing.base),
                      decoration: BoxDecoration(
                        color: colorScheme.secondaryContainer,
                        borderRadius: AppRadius.standard,
                      ),
                      child: Icon(
                        Icons.notifications_active,
                        color: colorScheme.onSecondaryContainer,
                      ),
                    ),
                    title: Text(
                      'Smart Notifications',
                      style: textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const RemindersNotificationsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Family Sharing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle(context, 'Family Sharing'),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: AppRadius.lg,
                  ),
                  child: Text(
                    'PREMIUM',
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                      color: colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withValues(alpha: 0.2),
                borderRadius: AppRadius.lg,
                border: Border.all(
                  color: colorScheme.primaryContainer.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 96,
                        height: 40,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 28,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    colorScheme.surfaceContainerLowest,
                                child: const CircleAvatar(
                                  radius: 18,
                                  backgroundImage: AssetImage(
                                    'assets/images/avatar_family_boy.jpg',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    colorScheme.surfaceContainerLowest,
                                child: const CircleAvatar(
                                  radius: 18,
                                  backgroundImage: AssetImage(
                                    'assets/images/avatar_family_girl.jpg',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 56,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    colorScheme.surfaceContainerLowest,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: colorScheme.primaryContainer,
                                  child: Icon(
                                    Icons.add,
                                    color: colorScheme.primary,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpacing.base),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shared Pantry',
                            style: textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                          Text(
                            '3 members active',
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 12,
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadius.xl,
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.group_add, size: 20),
                      label: Text(
                        'Manage Family Group',
                        style: textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Privacy & Data
            _buildSectionTitle(context, 'Privacy & Data'),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: _buildPrivacyCard(
                    context,
                    icon: Icons.download,
                    iconColor: colorScheme.primary,
                    title: 'Export Data',
                    subtitle: 'Download your grocery history in CSV format.',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildPrivacyCard(
                    context,
                    icon: Icons.delete_forever,
                    iconColor: colorScheme.error,
                    title: 'Clear Cache',
                    subtitle: 'Free up 124MB of local storage.',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BorderedCard(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.base),
                    decoration: BoxDecoration(
                      color: colorScheme.tertiaryContainer,
                      borderRadius: AppRadius.standard,
                    ),
                    child: Icon(
                      Icons.security,
                      color: colorScheme.onTertiaryContainer,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Privacy Policy',
                          style: textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'How we handle your list data',
                          style: textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.open_in_new, color: colorScheme.onSurfaceVariant),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Sign Out
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.logout, color: colorScheme.error),
              label: Text(
                'Sign Out',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.marginMobile,
                  vertical: AppSpacing.sm,
                ),
              ),
            ),
            const SizedBox(height: 100), // Bottom padding for nav bar
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildPrivacyCard(
    BuildContext context, {

    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return BorderedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(height: AppSpacing.sm),
          Text(
            title,
            style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            subtitle,
            style: textTheme.bodySmall?.copyWith(
              fontSize: 12,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
