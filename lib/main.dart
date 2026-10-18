import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';
import 'core/localization.dart';
import 'services/supabase_service.dart';
import 'screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppTheme.surfaceContainerLow,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const GroundSevaApp());
}

class GroundSevaApp extends StatelessWidget {
  const GroundSevaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SupabaseService()),
        ChangeNotifierProvider(create: (_) => AppLocalization()),
      ],
      child: Consumer<AppLocalization>(
        builder: (context, loc, _) => MaterialApp(
          title: 'GroundSeva Worker',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
