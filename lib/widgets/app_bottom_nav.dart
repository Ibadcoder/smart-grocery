import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../screens/scanner_screen.dart';


const String kRootRouteName = 'root';

/// Index of the "Scan" destination, which opens a fullscreen dialog rather than
/// selecting a tab.
const int kScanNavIndex = 2;

/// Holds the currently selected shell tab so that detail screens pushed on top
/// of the shell (Reminders, Monthly Comparison) can switch tabs after popping.
class AppShell {
  AppShell._();

  /// Home=0, List=1, Scan=2 (dialog, never persisted), Insights=3, Profile=4.
  static final ValueNotifier<int> selectedTab = ValueNotifier<int>(0);
}

/// A single destination in the bottom navigation bar.
class AppNavItem {
  final IconData icon;
  final IconData selectedIcon;
  final String label;

  const AppNavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}

/// The five destinations, matching the design reference order and labels.
const List<AppNavItem> kAppNavItems = [
  AppNavItem(
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
    label: 'Home',
  ),
  AppNavItem(
    icon: Icons.checklist,
    selectedIcon: Icons.checklist,
    label: 'List',
  ),
  AppNavItem(
    icon: Icons.document_scanner_outlined,
    selectedIcon: Icons.document_scanner,
    label: 'Scan',
  ),
  AppNavItem(
    icon: Icons.analytics_outlined,
    selectedIcon: Icons.analytics,
    label: 'Insights',
  ),
  AppNavItem(
    icon: Icons.person_outline,
    selectedIcon: Icons.person,
    label: 'Profile',
  ),
];

/// Handles a nav tap from a detail screen pushed on top of the shell.
///
/// Scan opens the scanner over the current screen; any tab selection updates
/// [AppShell.selectedTab] and pops back to the shell so the tab is shown.
void handleShellNavFromDetail(BuildContext context, int index) {
  if (index == kScanNavIndex) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) =>
            ScannerScreen(onClose: () => Navigator.pop(context)),
      ),
    );
    return;
  }
  AppShell.selectedTab.value = index;
  Navigator.of(
    context,
  ).popUntil((route) => route.settings.name == kRootRouteName || route.isFirst);
}

/// The single, shared bottom navigation bar used across every shell screen.
///
/// It is purely presentational: [currentIndex] highlights a destination and
/// [onDestinationSelected] reports taps. Matches the Stitch design reference —
/// a white, top-rounded bar with a pastel-green pill behind the active item.
class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(
          top: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.4),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 24,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.base,
          ),
          child: Row(
            children: [
              for (int i = 0; i < kAppNavItems.length; i++)
                Expanded(
                  child: _NavButton(
                    item: kAppNavItems[i],
                    selected: i == currentIndex,
                    onTap: () => onDestinationSelected(i),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final AppNavItem item;
  final bool selected;
  final VoidCallback onTap;

  const _NavButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final contentColor = selected
        ? colorScheme.onPrimaryContainer
        : colorScheme.onSurfaceVariant;

    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.lg,
      child: Align(
        alignment: Alignment.center,
        heightFactor: 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.base,
          ),
          decoration: BoxDecoration(
            color: selected ? colorScheme.primaryContainer : Colors.transparent,
            borderRadius: AppRadius.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                selected ? item.selectedIcon : item.icon,
                size: 24,
                color: contentColor,
              ),
              const SizedBox(height: 2),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  item.label,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 11,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                    color: contentColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
