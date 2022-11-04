import 'package:cadastro_clientes/home/company_model.dart';
import 'package:cadastro_clientes/home/cnpj_repository.dart';
import 'package:cadastro_clientes/home/home_repository.dart';

class HomeController {
  final CnpjRepository repository;
  final HomeRepository homeRepository;

  HomeController(this.repository, this.homeRepository);

  Future<CompanyModel?> getCompany(String cnpj) async {
    final formattedCnpj =
        cnpj.replaceAll('.', '').replaceAll('/', '').replaceAll('-', '');
    return await repository.getCompany(formattedCnpj);
  }

  Future<void> createCompany(CompanyModel company) async {
    final formattedCnpj = company.cnpj
        .replaceAll('.', '')
        .replaceAll('/', '')
        .replaceAll('-', '');
    final newCompany = company.copyWith(cnpj: formattedCnpj);
    final result = await homeRepository.createCompany(newCompany);
    print(result);
  }

  Future<List<CompanyModel>> getCompanies() async {
    final result = await homeRepository.getCompanies();
    return result;
  }

  Future<bool> deleteCompany(String id) async {
    return await homeRepository.deleteCompany(id);
  }
}
