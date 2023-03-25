
import 'package:finalexam/domain/category/repository/category_repository.dart';
import 'package:finalexam/domain/usecase.dart';

class GetCategoryUseCase extends GeneralUseCase<List<String>, void>{
  // param is void
  GetCategoryUseCase(CategoryRepository repository):super((param)=>repository.getCategories());
}