import 'package:cadastro_clientes/home/company_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeRepository {
  Future<bool> createCompany(CompanyModel company);
}

class HomeRepositoryHttp implements HomeRepository {
  final baseUrl = 'https://crudcrud.com/api/63e5dcae2b034e3b897fcc8e97f78c03';
  @override
  Future<bool> createCompany(CompanyModel company) async {
    final response = await http.post(Uri.parse(baseUrl + '/companies'),
        body: company.toJson(),
        headers: {
          "content-type": "application/json",
          "accept": "application/json"
        });
    print(response.statusCode);
    return true;
  }
}
