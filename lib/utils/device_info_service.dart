import 'dart:ffi';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

class DeviceDetails {
  final String? hwid;
  final String? os;
  final String? osVersion;
  final String? model;
  final String? appVersion;

  DeviceDetails({
    this.hwid,
    this.os,
    this.osVersion,
    this.model,
    this.appVersion,
  });
}

class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  String? _getWindowsMachineIdFromRegistry() {
    final keyPath = TEXT('SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\SoftwareProtectionPlatform\\Plugins\\Objects\\msft:rm/algorithm/hwid/4.0');
    final valueName = TEXT('ModuleId');
    try {
      final phkResult = calloc<HKEY>();
      final pvData = calloc<BYTE>(256);
      final pcbData = calloc<DWORD>()..value = 256;

      try {
        if (RegOpenKeyEx(HKEY_LOCAL_MACHINE, keyPath, 0, KEY_READ, phkResult) == ERROR_SUCCESS) {
          if (RegQueryValueEx(phkResult.value, valueName, nullptr, nullptr, pvData, pcbData) == ERROR_SUCCESS) {
            return pvData.cast<Utf16>().toDartString();
          }
        }
        return null;
      } finally {
        if (phkResult.value != 0) RegCloseKey(phkResult.value);
        free(phkResult);
        free(keyPath);
        free(valueName);
        free(pvData);
        free(pcbData);
      }
    } catch (e) {
      print('Failed to read registry for MachineId: $e');
      return null;
    }
  }

  Future<DeviceDetails> getDeviceDetails() async {
    String? hwid, os, osVersion, model;
    final packageInfo = await PackageInfo.fromPlatform();
    final appVersion = packageInfo.version;

    try {
      if (Platform.isWindows) {
        final info = await _deviceInfoPlugin.windowsInfo;
        hwid = _getWindowsMachineIdFromRegistry() ?? '${info.computerName}-${info.productId}';
        os = 'Windows';
        osVersion = info.displayVersion;
        model = info.productName;
      } else if (Platform.isAndroid) {
        final info = await _deviceInfoPlugin.androidInfo;
        hwid = info.id;
        os = 'Android';
        osVersion = info.version.release;
        model = '${info.manufacturer} ${info.model}';
      } else if (Platform.isLinux) {
        final info = await _deviceInfoPlugin.linuxInfo;
        hwid = info.machineId;
        os = 'Linux';
        osVersion = info.versionId;
        model = info.name;
      } else if (Platform.isMacOS) {
        final info = await _deviceInfoPlugin.macOsInfo;
        hwid = info.systemGUID;
        os = 'macOS';
        osVersion = info.osRelease;
        model = info.model;
      }
    } catch (e) {
      print('Failed to get device details: $e');
    }

    return DeviceDetails(
      hwid: hwid,
      os: os,
      osVersion: osVersion,
      model: model,
      appVersion: appVersion,
    );
  }
}