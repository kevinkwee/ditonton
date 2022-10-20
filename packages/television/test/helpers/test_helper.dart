import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:television/src/domain/repositories/television_repository.dart';

@GenerateNiceMocks([
  MockSpec<TelevisionRepository>(),
  MockSpec<IOClient>(as: #MockHttpClient),
])
void main() {}
