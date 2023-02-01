import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbase/data/http/interface/interface.dart';
import 'package:flutterbase/data/model/model.dart';
import 'package:mocktail/mocktail.dart';

class RestClientaa extends Mock implements RestClientAdapter {}

late String url;
late RestClientAdapter httpClient;

void main() {
  setUp(() {
    url = faker.internet.httpsUrl();
    httpClient = RestClientaa();
  });

  group('Group HttpRequest', () {
    test('Should request Get', () async {
      when(
        () => httpClient.get<String>(any()),
      ).thenAnswer((_) async => RestClientResponse(data: url));

      final called = await httpClient.get<String>(url);
      expect(called.data, url);

      verify(() => httpClient.get<String>(url)).called(1);
    });

    test('Should request POST', () async {
      when(
        () => httpClient.post<String>(any()),
      ).thenAnswer((_) async => RestClientResponse(data: url));

      final called = await httpClient.post<String>(url);
      expect(called.data, url);

      verify(() => httpClient.post<String>(url)).called(1);
    });

    test('Should request PUT', () async {
      when(
        () => httpClient.put<String>(any()),
      ).thenAnswer((_) async => RestClientResponse(data: url));

      final called = await httpClient.put<String>(url);
      expect(called.data, url);

      verify(() => httpClient.put<String>(url)).called(1);
    });

    test('Should request PATH', () async {
      when(
        () => httpClient.patch<String>(any()),
      ).thenAnswer((_) async => RestClientResponse(data: url));

      final called = await httpClient.patch<String>(url);
      expect(called.data, url);

      verify(() => httpClient.patch<String>(url)).called(1);
    });

    test('Should request DELETE', () async {
      when(
        () => httpClient.delete<String>(any()),
      ).thenAnswer((_) async => RestClientResponse(data: url));

      final called = await httpClient.delete<String>(url);
      expect(called.data, url);

      verify(() => httpClient.delete<String>(url)).called(1);
    });
  });
}
