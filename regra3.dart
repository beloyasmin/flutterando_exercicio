import 'dart:io';

void main() {
  print(regradetres(grupo11: null, grupo12: 4, grupo21: 2, grupo22: 4));
}

regradetres({
  required double? grupo11,
  required double? grupo12,
  required double? grupo21,
  required double? grupo22,
}) {
  List<double?> valores = [grupo11, grupo12, grupo21, grupo22];

  int valoresNulos = valores.where((v) => v == null).length;

  if (valoresNulos != 1) {
    throw ArgumentError("Um dos valores deve ser nulo");
  }

  if (grupo11 == null) {
    return grupo21! * grupo22! / grupo12!;
  } else if (grupo12 == null) {
    return grupo22! * grupo21! / grupo11;
  } else if (grupo21 == null) {
    return grupo11 * grupo12 / grupo22!;
  } else if (grupo22 == null) {
    return grupo11 * grupo12 / grupo21;
  }
  return null;
}
