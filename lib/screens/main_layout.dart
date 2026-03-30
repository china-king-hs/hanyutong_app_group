import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/app/learn')) return 1;
    if (location.startsWith('/app/profile')) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final idx = _currentIndex(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: idx,
        selectedItemColor: const Color(0xFF4285F4),
        unselectedItemColor: Colors.grey,
        onTap: (i) {
          switch (i) {
            case 0:
              context.go('/app');
              break;
            case 1:
              context.go('/app/learn');
              break;
            case 2:
              context.go('/app/profile');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home_outlined), label: AppLocalizations.of(context)!.home),
          BottomNavigationBarItem(
              icon: const Icon(Icons.menu_book_outlined), label: AppLocalizations.of(context)!.learning),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline), label: AppLocalizations.of(context)!.profile),
        ],
      ),
    );
  }
}
