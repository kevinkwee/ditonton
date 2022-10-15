import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

Future<SecurityContext> getGlobalSecurityContext() async {
  final sslCert = await rootBundle.load('certificates/certificate.pem');
  final securityContext = SecurityContext(withTrustedRoots: false);
  securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
  return securityContext;
}
