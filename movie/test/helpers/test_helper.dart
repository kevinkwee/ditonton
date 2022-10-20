import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:movie/src/data/datasources/db/database_helper.dart';
import 'package:movie/src/data/datasources/movie_local_data_source.dart';
import 'package:movie/src/data/datasources/movie_remote_data_source.dart';
import 'package:movie/src/domain/repositories/movie_repository.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<IOClient>(as: #MockHttpClient)
])
void main() {}
