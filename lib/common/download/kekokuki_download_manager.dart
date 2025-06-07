import 'dart:io';

import 'package:kekokuki/common/extensions/kekokuki_string_ext.dart';
import 'package:kekokuki/common/utils/kekokuki_download_util.dart';

import '../../common/utils/kekokuki_path_util.dart';
import '../utils/kekokuki_log_util.dart';
import 'kekokuki_download_queue.dart';

class KekokukiDownloadManager {
  String _downloadDirPath = '';
  final KekokukiDownloadQueue _queue = KekokukiDownloadQueue();

  /// 单例
  static KekokukiDownloadManager? _instance;
  static KekokukiDownloadManager get instance =>
      _instance ??= KekokukiDownloadManager._internal();
  KekokukiDownloadManager._internal() {
    _initDownloadDirectory();
  }

  Future<void> _initDownloadDirectory() async {
    String downloadDir = KekokukiPathUtil.downloadPath;
    final savedDir = Directory(downloadDir);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    _downloadDirPath = downloadDir;
  }

  Future<bool> isDownloaded(String urlString) async {
    if (urlString.isEmpty) return false;

    String downloadPath = downloadPathWithUrl(urlString);
    return await File(downloadPath).exists();
  }

  Future<bool> isDownloading(String urlString) async {
    if (urlString.isEmpty) return false;

    String downloadPath = downloadPathWithUrl(urlString);
    String tempPath = downloadPath.replaceAll('target', 'temp');
    return await File(tempPath).exists();
  }

  String downloadPathWithUrl(String urlString) {
    if (urlString.isEmpty) return '';

    String ext = urlString.split('.').last;
    return '$_downloadDirPath${urlString.md5}_target.$ext';
  }

  Future<void> preload(String urlString) async {
    if (urlString.isEmpty) return;
    if (await isDownloaded(urlString) || await isDownloading(urlString)) return;

    _queue.addTask(urlString, download);
  }

  Future<File?> download(
    String urlString, {
    Function(double value)? onProgress,
  }) async {
    if (urlString.isEmpty) return null;

    final downloadPath = downloadPathWithUrl(urlString);
    if (await isDownloaded(urlString)) {
      return File(downloadPath);
    }

    if (await isDownloading(urlString)) {
      return null;
    }

    try {
      String tempPath = downloadPath.replaceAll('target', 'temp');
      final isSuccess = await KekokukiDownloadUtil.download(
        url: urlString,
        savePath: tempPath,
        onReceiveProgress: (count, total) {
          if (onProgress != null) {
            onProgress(count / total);
          }
        },
      );
      final tempFile = File(tempPath);
      if (isSuccess && tempFile.existsSync()) {
        KekokukiLogUtil.i(
            'DownloadManager', 'download finished: $downloadPath');
        return tempFile.renameSync(downloadPath);
      } else {
        tempFile.delete().then((file) {}).catchError((err) {});
      }
    } catch (e) {
      KekokukiLogUtil.i('DownloadManager', 'download failed: ${e.toString()}');
    }
    return null;
  }
}
