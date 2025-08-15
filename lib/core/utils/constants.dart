class AppConstant {
  AppConstant._();

  //App info
  static const String appName = 'FileXpress';
  static const appVersion = '1.0.0';
  static const appDescription = 'Share files easily via Bluetooth and WiFi';

  //Connection constants
  static const String bluetoothServiceUuid =
      '0000180F-0000-1000-8000-00805F9B34FB';
  static const String wifiDirectServiceName = 'FileXpress';
  static const int connectionTimeoutSeconds = 30;
  static const int discoveryTimeoutSeconds = 60;

  //File constants
  static const int maxFileSize = 100 * 1024 * 1024;
  static const int maxFilesPerTransfer = 50;
  static const List<String> supportedFileExtensions = [
    // Documents
    '.pdf', '.doc', '.docx', '.txt', '.rtf', '.odt',
    // Images
    '.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp', '.svg',
    // Videos
    '.mp4', '.avi', '.mov', '.wmv', '.flv', '.webm', '.mkv',
    // Audio
    '.mp3', '.wav', '.aac', '.ogg', '.m4a', '.flac', '.wma',
    // Archives
    '.zip', '.rar', '.7z', '.tar', '.gz',
    // Applications
    '.apk', '.ipa',
    // Others
    '.json', '.xml', '.csv', '.xlsx',
  ];

  //UI constants
  static const double borderRadius = 12.0;
  static const double cardElevation = 4.0;
  static const double buttonHeight = 48.0;
  static const double iconSize = 24.0;
  static const double padding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;

  //RADAR ANIMATION CONSTANTS
  static const int radarScanDurationMs = 3000;
  static const int radarRippleCount = 3;
  static const double radarMaxRadius = 150.0;

  //TRANSFER CONSTANTS
  static const int transferChunkSize = 8192; //8KB chunks
  static const int transferTimeoutSeconds = 300; //5 mins
  static const int progressUpdateIntervalMs = 100;

  //STORAGE CONSTANTS
  static const String downloadsFolder = 'Downloads';
  static const String tempFolder = 'FileXpress_Temp';
  static const String prefsKey = 'file_xpress_prefs';

  //PERMISSION MESSAGES
  static const Map<String, String> permissionMessages = {
    'storage': 'Storage access is required to pick and save files',
    'bluetooth':
        'Bluetooth permission is needed to connect with nearby devices',
    'location': 'Location permission is required for WiFi Direct discovery',
    'nearby_wifi': 'WiFi permission is needed for peer-to-peer connections',
  };

  //ERROR MESSAGES
  static const Map<String, String> errorMessages = {
    'no_files_selected': 'Please select at least one file to share',
    'file_too_large': 'File size exceeds the limit of 100MB',
    'too_many_files': 'Maximum 50 files can be shared at once',
    'bluetooth_not_available': 'Bluetooth is not available on this device',
    'wifi_not_available': 'WiFi is not available on this device',
    'no_devices_found':
        'No nearby devices found. Make sure other device is in receive mode',
    'connection_failed': 'Failed to connect to the selected device',
    'transfer_failed': 'File transfer was interrupted or failed',
    'permission_denied': 'Required permissions are not granted',
    'unsupported_file': 'This file type is not supported',
  };

  //SUCCESS MESSAGES
  static const Map<String, String> successMessages = {
    'files_selected': 'Files selected successfully',
    'device_connected': 'Successfully connected to device',
    'transfer_completed': 'All files transferred successfully',
    'files_received': 'Files received and saved',
  };

  //Check if file extension is supported
  static bool isFileSupported(String fileName) {
    final extension = fileName.toLowerCase().substring(
      fileName.lastIndexOf('.'),
    );
    return supportedFileExtensions.contains(extension);
  }

  //Format file size for display
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024)
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  //Get file type from extension
  static String getFileType(String fileName) {
    final extension = fileName.toLowerCase().substring(
      fileName.lastIndexOf('.'),
    );

    if ([
      '.jpg',
      '.jpeg',
      '.png',
      '.gif',
      '.bmp',
      '.webp',
    ].contains(extension)) {
      return 'Image';
    } else if (['.mp4', '.avi', '.mov', '.wmv', '.flv'].contains(extension)) {
      return 'Video';
    } else if (['.mp3', '.wav', '.aac', '.ogg', '.m4a'].contains(extension)) {
      return 'Audio';
    } else if (['.pdf', '.doc', '.docx', '.txt'].contains(extension)) {
      return 'Document';
    } else if (extension == '.apk') {
      return 'Application';
    } else if (['.zip', '.rar', '.7z'].contains(extension)) {
      return 'Archive';
    }
    return 'File';
  }
}
