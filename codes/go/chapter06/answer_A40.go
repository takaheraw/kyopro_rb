package main

import (
	"fmt"
)

func main() {
	var N int
	fmt.Scan(&N)
	A := make([]int, N+1)
	for i := 1; i <= N; i++ {
		fmt.Scan(&A[i])
	}

	cnt := make([]int64, 101)
	for i := 1; i <= 100; i++ {
		cnt[i] = 0
	}
	for i := 1; i <= N; i++ {
		cnt[A[i]] += 1
	}

	var Answer int64 = 0
	for i := 1; i <= 100; i++ {
		Answer += cnt[i] * (cnt[i] - 1) * (cnt[i] - 2) / 6
	}
	fmt.Println(Answer)
}
