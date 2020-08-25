#include<iostream>
using namespace std;

int doublefoo(int c) {
	return c + c;
}

int minusfoo(int a, int b) {
	return a - b;
}

int multfoo(int a, int b) {
	return a * b;
}

int main() {
	cout << "Hello World!" << endl;
	cout << doublefoo(3) << endl;
	cout << minusfoo(4, 2) + multfoo(3, 3) << endl;
	cout << multfoo(2, 6) << endl;
	return 0;
}
