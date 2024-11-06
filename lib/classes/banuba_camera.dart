import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:ve_sdk_flutter/export_result.dart';
import 'package:ve_sdk_flutter/features_config.dart';
import 'package:ve_sdk_flutter/ve_sdk_flutter.dart';

const _licenseToken =
    "Qk5CIBwkHG3ptIeyz64SvrBcpgmxQukNhGVZdKzT4ycC9g9+s10fiKNkq6wrk4SDFutrJyGWdInvxHiI8ivwGvVUoMln+UfyLvlLVkU9aGUI4EWEFyIJHTyi/fYor9tdv7g+PcZwh1Ldl7st1Eyego4hShK3jARXAqA0F1zhBePUJ60FKY5ULie48LjO7/16rHtKd2mnOwCAS0K3F7/GFcoIVfq8nyLbMiLgRiBVVXSdAdtGMBQtddDws9YLCWudot1QKljoLMxN/lfgiwyZzpTDp+nz7I5YOXJ5ZzxMDBddqovowkJOjcRZ+iGlHzC0gM9j5DNWAOwygz6zOJzpYy2m2s1RWSiiOnBT6UcMVK94HcMJMLf4l7EXNxEmhmXpqWT+8hgQyifn4YtBto+iZhMFD3S3FBZVcOVTmDkkWDtFkfFKmF+AX3JJ5kAzIyjK6WTQMFk8I71segqA8AHwlZLj5ngcHQmqTsXKkeE/gUF4DLRpKI5dbNhbDuJnZnO79PipZiqwztuwHpSLXtwG3VtqvPyL3KdiqURoyUnuU1czwuB4LpSxHTJGqfBysdpTxFrCEr8sJ2HqyIuzXdxhqZ/muxHNelE1cZFllZUEHlhy2Uo1ZCe05e5flIbPwttwzBYn6El8XJ+4kYLIwtnw8Qlm";

class VideoEditingSDK {
  final _veSdkFlutterPlugin = VeSdkFlutter();

  Future<ExportResult?> startVideoEditorInCameraMode() async {
    dynamic exportResult;
    // Specify your Config params in the builder below

    final config = FeaturesConfigBuilder()
        .setDraftsConfig(DraftsConfig.fromOption(DraftsOption.auto))
        .setGifPickerConfig(const GifPickerConfig(
            giphyApiKey: "1L6KWZUkZzp0O74FO2HNt5VfL8h6d1d3"))
        // .setAiCaptions(...)
        // ...
        .build();

    // Export data example

    // const exportData = ExportData(exportedVideos: [
    //   ExportedVideo(
    //       fileName: "export_HD",
    //       videoResolution: VideoResolution.hd720p
    //   )],
    //     watermark: Watermark(
    //        imagePath: "assets/watermark.png",
    //        alignment: WatermarkAlignment.topLeft
    //     )
    // );

    try {
      exportResult =
          await _veSdkFlutterPlugin.openCameraScreen(_licenseToken, config);
      return exportResult;
    } on PlatformException catch (e) {
      log("Failed to open banuba editor $e");
    }
    return exportResult;
  }
}
