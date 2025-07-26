import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'grid_detailes_state.dart';

class GridDetailesCubit extends Cubit<GridDetailesState> {
  GridDetailesCubit() : super(GridDetailesInitial());

 String _searchText = '';
  List<int> _filteredIndices = []; // لتخزين مؤشرات الدروس المطابقة

  void searchLessons(String searchText, List<String> descriptions) {
    _searchText = searchText;

    if (searchText.isEmpty) {
      _filteredIndices = List.generate(descriptions.length, (index) => index);
    } else {
      _filteredIndices = descriptions
          .asMap()
          .entries
          .where((entry) => entry.value.contains(searchText))
          .map((entry) => entry.key)
          .toList();
    }

    emit(GridDetailesSearchState(_filteredIndices));
  }
}

