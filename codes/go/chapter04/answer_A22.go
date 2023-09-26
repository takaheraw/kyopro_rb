package main

import (
	"fmt"
)

func main() {
	var N int
	fmt.Scan(&N)
	A := make([]int, N+1)
	B := make([]int, N+1)
	for i := 1; i <= N-1; i++ {
		fmt.Scan(&A[i])
	}
	for i := 1; i <= N-1; i++ {
		fmt.Scan(&B[i])
	}

	dp := make([]int, N+1)
	dp[1] = 0
	for i := 2; i <= N; i++ {
		dp[i] = -1000000000
	}

	for i := 1; i <= N-1; i++ {
		dp[A[i]] = max(dp[A[i]], dp[i]+100)
		dp[B[i]] = max(dp[B[i]], dp[i]+150)
	}

	fmt.Println(dp[N])
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
