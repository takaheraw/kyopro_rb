package main

import (
	"fmt"
)

func main() {
	var N int
	fmt.Scan(&N)

	T := make([]string, N+1)
	A := make([]int, N+1)
	for i := 1; i <= N; i++ {
		fmt.Scan(&T[i])
		fmt.Scan(&A[i])
	}

	var Answer int64 = 0
	for i := 1; i <= N; i++ {
		if T[i] == "+" {
			Answer += int64(A[i])
		}
		if T[i] == "-" {
			Answer -= int64(A[i])
		}
		if T[i] == "*" {
			Answer *= int64(A[i])
		}

		if Answer < 0 {
			Answer += 10000
		}

		Answer %= 10000
		fmt.Println(Answer)
	}
}
