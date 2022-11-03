import 'package:cadastro_clientes/home/company_model.dart';
import 'package:cadastro_clientes/home/home_repository.dart';

class HomeController {
  final HomeRepository repository;

  HomeController(this.repository);

  Future<CompanyModel?> getCompany(String cnpj) async {
    final formattedCnpj =
        cnpj.replaceAll('.', '').replaceAll('/', '').replaceAll('-', '');
    return await repository.getCompany(formattedCnpj);
  }
}
