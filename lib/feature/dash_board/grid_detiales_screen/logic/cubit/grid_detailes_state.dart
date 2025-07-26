part of 'grid_detailes_cubit.dart';

sealed class GridDetailesState extends Equatable {
  const GridDetailesState();

  @override
  List<Object> get props => [];
}

final class GridDetailesInitial extends GridDetailesState {}

class GridDetailesSearchState extends GridDetailesState {
  final List<int> filteredIndices; // مؤشرات الدروس المطابقة

  const GridDetailesSearchState(this.filteredIndices);

  @override
  List<Object> get props => [filteredIndices];
}