import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:ve_sdk_flutter/export_result.dart';
import 'package:ve_sdk_flutter/features_config.dart';
import 'package:ve_sdk_flutter/ve_sdk_flutter.dart';

const _licenseToken =
    "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";

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
        .setAiClipping(
          const AiClipping(
            audioDataUrl:
                "https://ve-autocut-v2-ap-south-1.s3.ap-south-1.amazonaws.com/index.zip",
            audioTracksUrl: "https://soundstripe-proxy.banuba.net/v1/songs",
          ),
        )
        .setAiCaptions(
          const AiCaptions(
              uploadUrl: "https://internal.transcribe.banuba.net",
              transcribeUrl:
                  "https://rest.internal.transcribe.banuba.net/transcribe/v1/status",
              apiKey: "CheiYaaphoK6eungecheec4eingeik9shaijiech"),
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
