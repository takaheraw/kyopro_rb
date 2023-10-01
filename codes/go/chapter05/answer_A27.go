package main

import "fmt"

func main() {
	var A, B int
	fmt.Scan(&A, &B)
	fmt.Println(GCD(A, B))
}

func GCD(A int, B int) int {
	for A >= 1 && B >= 1 {
		if A >= B {
			A %= B
		} else {
			B %= A
		}
	}
	if A >= 1 {
		return A
	}
	return B
}
