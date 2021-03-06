import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_admin/components/cryRoot.dart';
import 'package:flutter_admin/utils/localStorageUtil.dart';
import './pages/layout/layout1.dart';
import './pages/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './generated/l10n.dart';
import 'constants/constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CryRoot(
      BotToastInit(
        child: Builder(
          builder: (context) {
            return MaterialApp(
              title: 'FLUTTER_ADMIN',
              navigatorObservers: [BotToastNavigatorObserver()],
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              localizationsDelegates: [
                S.delegate, // class from the generate l10n.dart file
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: Locale(CryRootScope.of(context).state.locale),
              home: LocalStorageUtil.get(Constant.KEY_TOKEN) == null ? Login() : Layout1(),
            );
          },
        ),
      ),
    );
  }
}
