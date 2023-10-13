import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:vtb_hack/core/constants.dart';
import 'package:vtb_hack/data/enum.dart';
import 'package:vtb_hack/data/service/write_log.dart';
import 'package:vtb_hack/di/service_locator.dart';
import 'package:vtb_hack/features/map_page/ui/map_page.dart';
// import 'package:quick_meet/features/auth/auth_with_sms/step_one_phone/ui/auth_sms_page.dart';
// import 'package:quick_meet/features/auth/auth_with_password/ui/auth_password_page.dart';
// import 'package:quick_meet/features/auth/auth_with_sms/step_two_code/ui/auth_sms_code_page.dart';
// import 'package:quick_meet/test_ui/ui/create_meet_pages/create_meet_page.dart';
// import 'package:quick_meet/test_ui/ui/main_pages/main_page.dart';
// import 'package:quick_meet/test_ui/ui/main_pages/map_page.dart';
// import 'package:quick_meet/test_ui/ui/main_pages/meetings_pages/meetings_page.dart';
// import 'package:quick_meet/features/profile/profile_editor/ui/profile_edit_page.dart';
// import 'package:quick_meet/features/profile/profile_page/ui/profile_page.dart';
// import 'package:quick_meet/features/reset_password/step_three/ui/password_recovery_enter_page.dart';
// import 'package:quick_meet/features/reset_password/step_one/ui/password_recovery_phone_page.dart';
// import 'package:quick_meet/features/reset_password/step_two/ui/password_recovery_sms_code_page.dart';
// import 'package:quick_meet/features/registration/step_four_fields/ui/reg_final_page.dart';
// import 'package:quick_meet/features/registration/step_three_password/reg_password_page.dart';
// import 'package:quick_meet/features/registration/step_one_phone/ui/reg_phone_page.dart';
// import 'package:quick_meet/features/registration/step_two_code/ui/reg_sms_code_page.dart';
// import 'package:quick_meet/features/auth/auth_start/start_page.dart';

void main() {
  runZonedGuarded(
    () async {
      var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
      );
      runApp(const MyApp());
    },
    (e, s) {
      WriteLogs.write('[!!!]     Global error: $e');
      WriteLogs.write('[!!!]     Stack: $s');
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final globalStream = StreamController<GlobalEvents>.broadcast();
  bool loading = true;

  @override
  void initState() {
    super.initState();

    init(globalStream).then((auth) {
      setState(() {
        loading = false;
      });
      FlutterNativeSplash.remove();
    });

    globalStream.stream.listen((event) {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => getIt),
        ],
        child: (!loading)
            ? const MaterialApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  // '/auth_sms_page': (context) => const AuthSmsPage(),
                },
                home: MapScreen(),
              )
            : const SizedBox.shrink());
  }

  Future<bool> init(StreamController<GlobalEvents> gs) async {
    bool isAuth = await setup(gs);

    var url = Uri.tryParse(AppConstants.baseUrl);

    if (url == null) {
      throw 'AppConstants.serverUrl error';
    }

    return isAuth;
  }
}
