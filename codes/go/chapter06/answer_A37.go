package main

import "fmt"

func main() {
	var N, M, B int
	fmt.Scan(&N, &M, &B)
	A := make([]int, N)
	for i := 0; i < N; i++ {
		fmt.Scan(&A[i])
	}
	C := make([]int, M)
	for i := 0; i < M; i++ {
		fmt.Scan(&C[i])
	}

	Answer := 0
	for i := 0; i < N; i++ {
		Answer += A[i] * M
	}
	Answer += B * N * M
	for j := 0; j < M; j++ {
		Answer += C[j] * N
	}

	fmt.Println(Answer)
}
