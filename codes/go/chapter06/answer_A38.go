package main

import (
	"fmt"
)

func main() {
	var D, N int
	fmt.Scan(&D, &N)

	L := make([]int, N+1)
	R := make([]int, N+1)
	H := make([]int, N+1)

	for i := 1; i <= N; i++ {
		fmt.Scan(&L[i], &R[i], &H[i])
	}

	LIM := make([]int, D+1)
	for i := 1; i <= D; i++ {
		LIM[i] = 24
	}

	for i := 1; i <= N; i++ {
		for j := L[i]; j <= R[i]; j++ {
			if LIM[j] > H[i] {
				LIM[j] = H[i]
			}
		}
	}

	var Answer int
	for i := 1; i <= D; i++ {
		Answer += LIM[i]
	}
	fmt.Println(Answer)
}
