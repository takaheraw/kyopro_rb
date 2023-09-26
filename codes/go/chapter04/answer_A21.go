package main

import (
	"fmt"
)

func main() {
	var N int
	fmt.Scan(&N)
	P := make([]int, N+1)
	A := make([]int, N+1)
	for i := 1; i <= N; i++ {
		fmt.Scan(&P[i], &A[i])
	}

	dp := make([][]int, N+1)
	for i := 0; i <= N; i++ {
		dp[i] = make([]int, N+1)
	}
	dp[1][N] = 0
	for LEN := N - 2; LEN >= 0; LEN-- {
		for l := 1; l <= N-LEN; l++ {
			r := l + LEN

			score1 := 0
			if l >= 2 && l <= P[l-1] && P[l-1] <= r {
				score1 = A[l-1]
			}

			score2 := 0
			if r <= N-1 && l <= P[r+1] && P[r+1] <= r {
				score2 = A[r+1]
			}

			if l == 1 {
				dp[l][r] = dp[l][r+1] + score2
			} else if r == N {
				dp[l][r] = dp[l-1][r] + score1
			} else {
				dp[l][r] = max(dp[l-1][r]+score1, dp[l][r+1]+score2)
			}
		}
	}

	answer := 0
	for i := 1; i <= N; i++ {
		answer = max(answer, dp[i][i])
	}
	fmt.Println(answer)
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
