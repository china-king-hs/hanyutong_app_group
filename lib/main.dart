import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'app_state.dart';
import 'router.dart';
import 'config/app_languages.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ── Windows 桌面：设置窗口为手机比例 390 × 844 ──
  await windowManager.ensureInitialized();
  const windowOptions = WindowOptions(
    size: Size(390, 844),
    minimumSize: Size(360, 640),
    center: true,
    title: '汉语通',
    titleBarStyle: TitleBarStyle.normal,
  );
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  // ─────────────────────────────────────────────────

  final appState = AppState();
  await appState.init();

  runApp(
    ChangeNotifierProvider(
      create: (_) => appState,
      child: const ChineseGoApp(),
    ),
  );
}

class ChineseGoApp extends StatelessWidget {
  const ChineseGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = buildRouter(context);
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return MaterialApp.router(
          title: '汉语通',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4285F4)),
            useMaterial3: true,
            fontFamily: 'Roboto',
          ),
          routerConfig: router,
          // 多语言支持配置
          locale: Locale(appState.language),
          supportedLocales: supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            // 如果用户选择的语言在支持列表中，使用用户选择的语言
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            // 否则使用英语作为默认语言
            return const Locale('en');
          },
        );
      },
    );
  }
}
