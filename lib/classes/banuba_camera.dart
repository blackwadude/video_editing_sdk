import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:ve_sdk_flutter/export_result.dart';
import 'package:ve_sdk_flutter/features_config.dart';
import 'package:ve_sdk_flutter/ve_sdk_flutter.dart';

const _licenseToken =
    "Qk5CIBlM5WKruWGm35/uHsee3/9AxG3/8h1S/Jcb3/81HA5unfoDMCa8SBsZ6PMLT6QLjQadJSCQZKCkGBs+PkkLGfB0DcdYs7RUQtDLl7SVz0sPTINgH8u4h2CjhB3zf1AAg1I1TDpHoMjR4COKe9ZyUXJe4wYiwQMUi7BBbMrm/OV83aKvjtRlIniE0uqIsF/RAsQYSGf45q63tUDBgEYli0kio8Y3eYuXbF8T0qYhNqH9lbLb8oFtGL6QdgbV2wskkLZuDtAajjOazstWUvwFzdN7Jqo5nbECejQ8sq71J5NviTWk2Ms9JBbVIetpUs1bDDWz9fZ1S+xNfCJ8d0qhOCffrSQK4O6zN7gYlOjeqKFUhMiDNJT7sG15itqSE/0edwlPRnolCgoFkoXxSVX3lJIqgqq1P6sQaFZPhxJK7ROUiQMHuzAUtAcFMfNIlabpA7IDDBEZoMciV5tQvg5fCtHUk1nKHPaRYsM0QyAeV7IEK1t1aHn7XaMOMEaVf+g8FxgPrp5tK2hbgoCL/UIJ+5bi3Dk8j2KjzIoPwT61dB7ciJy57nnpZeQphEozrNb0r4xFrOVKtza85+GHnFTzP6a/eXFSHfuXt8g3Z1Psao2yD+hbsoHjzq3kZ4eVKqJud1Kan29L75yOy+w1ryFCXw==";

class VideoEditingSDK {
  final _veSdkFlutterPlugin = VeSdkFlutter();

  Future<ExportResult?> startVideoEditorInCameraMode() async {
    dynamic exportResult;
    // Specify your Config params in the builder below

    final config = FeaturesConfigBuilder()
        .setDraftsConfig(
          DraftsConfig.fromOption(DraftsOption.auto),
        )
        .setGifPickerConfig(
          const GifPickerConfig(
            giphyApiKey: "1L6KWZUkZzp0O74FO2HNt5VfL8h6d1d3",
          ),
        )
        .setAudioBrowser(
          AudioBrowser.fromSource(AudioBrowserSource.soundstripe),
        )
        // .setAiClipping(AiClipping(audioDataUrl: audioDataUrl, audioTracksUrl: audioTracksUrl))
        // .setAiCaptions(...)
        // ...
        .build();
    try {
      exportResult =
          await _veSdkFlutterPlugin.openCameraScreen(_licenseToken, config);
      return exportResult;
    } on PlatformException catch (e) {
      log("Failed to open banuba editor $e");
    }
    return exportResult;
  }

  Future<void> startVideoEditorInPipMode(String sourceVideoPath) async {
    dynamic exportResult;

    final config = FeaturesConfigBuilder()
        // .setAudioBrowser(...)
        // ...
        .build();
    try {
      exportResult = await _veSdkFlutterPlugin.openPipScreen(
          _licenseToken, config, sourceVideoPath);
      return exportResult;
    } on PlatformException catch (e) {
      log("Failed to open banuba editor $e");
    }
    return exportResult;
  }

  Future<ExportResult?> startVideoEditorInTrimmerMode(
      List<String> sourceVideoPathList) async {
    dynamic exportResult;
    final config = FeaturesConfigBuilder()
        // .setDraftConfig(...)
        //...
        .build();
    try {
      exportResult = await _veSdkFlutterPlugin.openTrimmerScreen(
          _licenseToken, config, sourceVideoPathList);
      return exportResult;
    } on PlatformException catch (e) {
      log("Failed to open banuba editor $e");
    }
    return exportResult;
  }
}
