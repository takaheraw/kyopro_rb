package main

import (
	"fmt"
)

func main() {
	var N int
	fmt.Scan(&N)
	A := make([]int, N)
	for i := 0; i < N; i++ {
		fmt.Scan(&A[i])
	}

	dp := make([][]int, N+1)
	for i := 0; i <= N; i++ {
		dp[i] = make([]int, N+1)
	}

	for j := 1; j <= N; j++ {
		dp[N][j] = A[j-1]
	}

	for i := N - 1; i >= 1; i-- {
		for j := 1; j <= i; j++ {
			if i%2 == 1 {
				dp[i][j] = max(dp[i+1][j], dp[i+1][j+1])
			}
			if i%2 == 0 {
				dp[i][j] = min(dp[i+1][j], dp[i+1][j+1])
			}
		}
	}

	fmt.Println(dp[1][1])
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}
