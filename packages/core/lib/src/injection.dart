import 'dart:io';

import 'package:core/src/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

final locator = GetIt.instance;

void init() {
  // external
  locator.registerSingletonAsync<Client>(
    () async => IOClient(
      HttpClient(context: await getGlobalSecurityContext()),
    ),
  );
}
