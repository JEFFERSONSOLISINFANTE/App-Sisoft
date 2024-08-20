import '../features/shop/models/category_model.dart';
import '../utils/constants/image_strings.dart';

class TData {
  static final List<CategoryModel> categories = [

    ///categorias
    CategoryModel(id: '1', image: TImages.pcIcon, name: 'Computadoras', isFeatured: true),
    CategoryModel(id: '5', image: TImages.laptopIcon, name: 'Laptops', isFeatured: true),
    CategoryModel(id: '2', image: TImages.impresoraIcon, name: 'Impresoras', isFeatured: true),
    CategoryModel(id: '3', image: TImages.camaraIcon, name: 'Cámaras', isFeatured: true),
    CategoryModel(id: '4', image: TImages.tintaIcon, name: 'Tintas', isFeatured: true),
    CategoryModel(id: '6', image: TImages.mantenimientoIcon, name: 'Mantenimiento', isFeatured: true),

    ///Sub categorias computadoras
    CategoryModel(id: '7', image: TImages.pcIcon, name: 'Nuevas', isFeatured: false),
    CategoryModel(id: '8', image: TImages.pcIcon, name: 'Reparadas', isFeatured: false),

  ];


}