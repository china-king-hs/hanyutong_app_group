import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../app_state.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> with RouteAware {
  String? _currentLocation;

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/app/learn')) return 1;
    if (location.startsWith('/app/profile')) return 2;
    return 0;
  }

  // 判断是否在学习相关的页面
  bool _isInLearningPage(String location) {
    return location.startsWith('/app/learn') ||
           location.startsWith('/practice/') ||
           location.startsWith('/advanced/');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final router = GoRouter.of(context);
    final newLocation = router.routeInformationProvider.value.uri.toString();

    // 检测路由变化,管理学习计时
    if (_currentLocation != newLocation) {
      final appState = Provider.of<AppState>(context, listen: false);

      // 如果之前在学习页面,现在离开,结束计时
      if (_currentLocation != null && _isInLearningPage(_currentLocation!) && !_isInLearningPage(newLocation)) {
        appState.endLearningSession();
      }
      // 如果现在进入学习页面,开始计时
      else if (_isInLearningPage(newLocation) && (_currentLocation == null || !_isInLearningPage(_currentLocation!))) {
        appState.startLearningSession();
      }

      _currentLocation = newLocation;
    }
  }

  @override
  Widget build(BuildContext context) {
    final idx = _currentIndex(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: widget.child,
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
