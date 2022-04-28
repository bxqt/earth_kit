import 'dart:io';

import 'package:args/args.dart';
import 'properties/property_parser.dart';

import 'shrinker.dart';

const shrink = 'shrink';
const parse = 'parse';

String path;
String fileName;
String fileNameWithoutSuffix;

void fromArgs(List<String> args) {
  final parser = ArgParser()
    ..addOption(
      parse,
      abbr: 'p',
    )
    ..addOption(
      shrink,
      abbr: 's',
    );

  final results = parser.parse(args);
  exitOnError(results);
  setPath(results.rest.first);

  if (results[shrink] != null) {
    shrinkTopoJson(results[shrink]);
  } else if (results[parse] != null) {
    createDartFileFromProperties(results[parse]);
  } else {
    print('No option found for $args');
    exit(2);
  }

  exit(0);
}

void setPath(String raw) {
  final endIndex = Platform.isWindows ? raw.lastIndexOf('\\') : raw.lastIndexOf('/');
  path = raw.substring(0, endIndex + 1);
  fileName = raw.substring(endIndex + 1);
  fileNameWithoutSuffix = fileName.substring(0, fileName.indexOf('.'));
}

void exitOnError(ArgResults args) {
  if (args.rest.isEmpty) {
    print('No path specified');
    exit(2);
  }
}
