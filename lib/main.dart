import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';

import 'core/spotify.dart';

final shellKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DesktopWindow.setWindowSize(const Size(1280, 720));
  await DesktopWindow.setMaxWindowSize(const Size(1280, 720));
  await DesktopWindow.setMinWindowSize(const Size(800, 600));

  runApp(const Spotify());
}
