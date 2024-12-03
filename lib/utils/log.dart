import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    printTime: false,
  ),
);

const String _tag = "Fast";

void LogD(String msg) {
  if (kDebugMode) {
    String caller = '';
    try {
      caller = StackTrace.current.toString().split('\n')[1];
      // Extract the file location and method name
      final location = _extractLocation(caller);
      final methodName = caller.split(' ').last.split('.').last;
      _logger.d("$_tag :: $location :: $methodName :: $msg");
    } catch (e) {
      _logger.d("$_tag :: $msg");
    }
  }
}

LogI(String msg, BuildContext context) {
  final currentPage = _getCurrentPage(context);
  _logger.i("$_tag [$currentPage] :: $msg");
}

LogW(String msg) {
  _logger.w("$_tag :: $msg");
}

LogE(String msg) {
  _logger.e("$_tag :: $msg");
}

LogWTF(String msg) {
  _logger.wtf("$_tag :: $msg");
}

String _getCurrentPage(BuildContext context) {
  final currentRoute = ModalRoute.of(context)?.settings.name;
  if (currentRoute != null) {
    return currentRoute;
  }
  return "Unknown";
}

String _extractLocation(String frame) {
  try {
    // Handle package trace format
    final packageMatch = RegExp(r'package:([^/]+)/(.+) ').firstMatch(frame);
    if (packageMatch != null) {
      return packageMatch.group(2)?.split(' ').first ?? 'unknown location';
    }
    
    // Handle file trace format
    final fileMatch = RegExp(r'(?:file:\/\/)?([^:]+):(\d+):').firstMatch(frame);
    if (fileMatch != null) {
      final path = fileMatch.group(1);
      final line = fileMatch.group(2);
      // Get relative path by finding lib/ or test/
      final libIndex = path?.indexOf('lib/');
      final testIndex = path?.indexOf('test/');
      final startIndex = [libIndex ?? -1, testIndex ?? -1]
          .where((i) => i >= 0)
          .fold(-1, (a, b) => a > b ? a : b);
      
      if (startIndex >= 0 && path != null) {
        return '${path.substring(startIndex)}:$line';
      }
      return '$path:$line';
    }
  } catch (e) {
    // If any error occurs during parsing, return the frame
    return frame;
  }
  return 'unknown location';
}
