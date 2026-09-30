import 'package:flutter/material.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/app_top_bar.dart';
import 'home_dashboard_screen.dart';
import 'smart_checklist_screen.dart';
import 'scanner_screen.dart';
import 'insights_screen.dart';
import 'profile_settings_screen.dart';
import 'add_edit_item_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  /// Route name so detail screens pushed on top can pop back to the shell.
  static const String routeName = kRootRouteName;

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  void _openScanner() {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) =>
            ScannerScreen(onClose: () => Navigator.pop(context)),
      ),
    );
  }

  void _openAddItem() {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) =>
            AddEditItemScreen(onClose: () => Navigator.pop(context)),
      ),
    );
  }

  void _onNavSelected(int index) {
    if (index == kScanNavIndex) {
      _openScanner(); // Scan is a fullscreen dialog, not a tab.
      return;
    }
    AppShell.selectedTab.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: AppShell.selectedTab,
      builder: (context, currentIndex, _) {
        return Scaffold(
          appBar: const AppTopBar(),
          body: IndexedStack(
            index: currentIndex,
            children: [
              const HomeDashboardScreen(),
              SmartChecklistScreen(onAddItem: _openAddItem),
              const SizedBox.shrink(), // Placeholder for Scan (opens as dialog).
              const InsightsScreen(),
              const ProfileSettingsScreen(),
            ],
          ),
          bottomNavigationBar: AppBottomNav(
            currentIndex: currentIndex,
            onDestinationSelected: _onNavSelected,
          ),
        );
      },
    );
  }
}
