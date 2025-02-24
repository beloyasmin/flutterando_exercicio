import 'dart:io';

List<int> fibonaccilist(int n) {
  List<int> fiblist = [];
  for (int i = 0; i <= n; i++) {
    fiblist.add(fibonacci(i));
  }
  return fiblist;
}

int fibonacci(int n) {
  if (n == 0) return 0;
  if (n == 1) return 1;

  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
  List<int> result = fibonaccilist(15);
  print(result);
}
