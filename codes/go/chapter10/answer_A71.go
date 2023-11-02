package main

import (
	"fmt"
	"sort"
)

func main() {
	var N int
	fmt.Scan(&N)
	A := make([]int, N)
	B := make([]int, N)
	for i := 0; i < N; i++ {
		fmt.Scan(&A[i])
	}
	for i := 0; i < N; i++ {
		fmt.Scan(&B[i])
	}

	sort.Ints(A)
	sort.Sort(sort.Reverse(sort.IntSlice(B)))

	answer := 0
	for i := 0; i < N; i++ {
		answer += A[i] * B[i]
	}
	fmt.Println(answer)
}
