package main

import (
	"fmt"
	"sort"
)

func main() {
	var N int
	fmt.Scan(&N)

	A := make([][2]int, N)
	for i := 0; i < N; i++ {
		fmt.Scan(&A[i][0], &A[i][1])
	}

	sort.Slice(A, func(i, j int) bool {
		return A[i][1] < A[j][1]
	})

	var CurrentTime int
	var Answer int
	for i := 0; i < N; i++ {
		if CurrentTime <= A[i][0] {
			CurrentTime = A[i][1]
			Answer += 1
		}
	}

	fmt.Println(Answer)
}
