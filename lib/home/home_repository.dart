import 'dart:convert';

import 'package:cadastro_clientes/home/company_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeRepository {
  Future<bool> createCompany(CompanyModel company);
  Future<List<CompanyModel>> getCompanies();
  Future<bool> deleteCompany(String id);
}

class HomeRepositoryHttp implements HomeRepository {
  final baseUrl = 'https://crudcrud.com/api/4a4f9e6c4a5946edb4d9b521f4f18846';
  @override
  Future<bool> createCompany(CompanyModel company) async {
    final response = await http.post(Uri.parse('$baseUrl/companies'),
        body: company.toJson(),
        headers: {
          "content-type": "application/json",
          "accept": "application/json"
        });
    return true;
  }

  @override
  Future<List<CompanyModel>> getCompanies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/companies'),
    );
    final list = List.from(jsonDecode(response.body));
    final company = list.map((e) => CompanyModel.fromMap(e)).toList();
    return company;
  }

  @override
  Future<bool> deleteCompany(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/companies/$id'),
    );
    return response.statusCode == 200;
  }
}
