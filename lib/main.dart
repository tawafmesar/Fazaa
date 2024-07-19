
import 'package:fazaa/providers/chats_provider.dart';
import 'package:fazaa/providers/models_provider.dart';
import 'package:fazaa/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart'; // Import the provider package

import 'bindings/intialbindings.dart';
import 'core/constant/color.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await FlutterDownloader.initialize(
      debug:
      true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
      true // option: set to false to disable working with http links (default: false)
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ModelsProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ChatProvider(),
          ),
        ],
        child: GetMaterialApp(
          title: 'Smart Assistant',
          translations: MyTranslation(),
          debugShowCheckedModeBanner: false,
          locale: controller.language,
          theme: ThemeData(
            fontFamily: "NotoKufiArabic",
            textTheme: const TextTheme(

                headline1: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColor.black),
                headline2: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: AppColor.black),
                bodyText1: TextStyle(
                    height: 2,
                    color: AppColor.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ),
          initialBinding:initialBindings() ,
          getPages: routes,

        ));
  }
}
