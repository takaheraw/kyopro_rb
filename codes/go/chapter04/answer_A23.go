package main

import (
	"fmt"
)

func main() {
	var N, M int
	fmt.Scan(&N, &M)
	A := make([][]int, M)
	for i := 0; i < M; i++ {
		A[i] = make([]int, N)
		for j := 0; j < N; j++ {
			fmt.Scan(&A[i][j])
		}
	}

	dp := make([][]int, M+1)
	for i := 0; i <= M; i++ {
		dp[i] = make([]int, 1<<N)
		for j := 0; j < (1 << N); j++ {
			dp[i][j] = 1e9
		}
	}

	dp[0][0] = 0
	for i := 1; i <= M; i++ {
		for j := 0; j < (1 << N); j++ {
			already := make([]int, N)
			for k := 0; k < N; k++ {
				if (j/(1<<k))%2 == 0 {
					already[k] = 0
				} else {
					already[k] = 1
				}
			}

			v := 0
			for k := 0; k < N; k++ {
				if already[k] == 1 || A[i-1][k] == 1 {
					v += (1 << k)
				}
			}

			dp[i][j] = min(dp[i][j], dp[i-1][j])
			dp[i][v] = min(dp[i][v], dp[i-1][j]+1)
		}
	}

	if dp[M][(1<<N)-1] == 1e9 {
		fmt.Println("-1")
	} else {
		fmt.Println(dp[M][(1<<N)-1])
	}
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}
