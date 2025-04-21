import 'package:flutter/material.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:baseball_diary/app/my_app.dart';

void main() => runApp(
  DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
);
