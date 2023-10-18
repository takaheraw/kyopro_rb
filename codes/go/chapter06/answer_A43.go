package main

import (
	"fmt"
)

func main() {
	var N, L int
	fmt.Scan(&N, &L)
	A := make([]int, N)
	B := make([]string, N)
	for i := 0; i < N; i++ {
		fmt.Scan(&A[i], &B[i])
	}

	Answer := 0
	for i := 0; i < N; i++ {
		if B[i] == "E" {
			if Answer < L-A[i] {
				Answer = L - A[i]
			}
		} else if B[i] == "W" {
			if Answer < A[i] {
				Answer = A[i]
			}
		}
	}

	fmt.Println(Answer)
}
