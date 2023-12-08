import 'package:equatable/equatable.dart';

class CustomDropDownItem extends Equatable {
  final String label;
  final dynamic value;
  final List<CustomDropDownItem>? children;
  final Object? leading;

  const CustomDropDownItem(
      {this.leading, required this.label, required this.value, this.children});

  @override
  List<Object?> get props => [label, value,leading];
}
