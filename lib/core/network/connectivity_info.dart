import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';

/// Handles local connectivity information (Bluetooth, WiFi)
abstract class ConnectivityInfo {
  //check if bluetooth is available and enabled
  Future<bool> get isBluetoothAvailable;

  //check if wifi is available
  Future<bool> get isWifiAvailable;

  //get current wifi network name
  Future<String?> get wifiName;

  //get device wifi ip address
  Future<String?> get wifiIp;

  //check if device supports wifi direct
  Future<bool> get supportsWifiDirect;
}

class ConnectivityInfoImpl implements ConnectivityInfo {
  final NetworkInfo _networkInfo;

  ConnectivityInfoImpl(this._networkInfo);

  @override
  Future<bool> get isBluetoothAvailable async {
    try {
      //check if device supports bluetooth
      if (!await FlutterBluePlus.isSupported) {
        return false;
      }

      //check if bluetooth adapter is available
      final adapterSate = FlutterBluePlus.adapterState.first;
      return adapterSate == BluetoothAdapterState.on;
    } catch(e) {
      return false;
    }
  }

  @override
  Future<bool> get isWifiAvailable async {
    try {
      final wifiName = await _networkInfo.getWifiName();
      return wifiName != null && wifiName.isNotEmpty;
    } catch(e) {
      return false;
    }
  }

  @override
  Future<bool> get supportsWifiDirect async {
    return Platform.isAndroid; //since wifi direct is supported on most android devices
  }

  @override
  Future<String?> get wifiIp async {
    try {
      return await _networkInfo.getWifiIP();
    } catch(e) {
      return null;
    }
  }

  @override
  // TODO: implement wifiName
  Future<String?> get wifiName async {
    try {
      return await _networkInfo.getWifiName();
    } catch(e) {
      return null;
    }
  }

  //get bluetooth adapter state
  Stream<BluetoothAdapterState> get bluetoothStateStream {
    return FlutterBluePlus.adapterState;
  }

  //enable bluetooth (Android only - requires user permission)
  Future<void> enableBluetooth() async {
    try {
      if (Platform.isAndroid) {
        await FlutterBluePlus.turnOn();
      }
    } catch(e) {
      rethrow;
    }
  }
}