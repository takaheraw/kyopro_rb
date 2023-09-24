package main

import (
	"fmt"
)

func main() {
	// 入力
	s := "tokyo"
	t := "kyoto"
	n := len(s)
	m := len(t)

	// 配列 dp の定義
	dp := make([][]int, n+1)
	for i := range dp {
		dp[i] = make([]int, m+1)
	}

	// 動的計画法
	dp[0][0] = 0
	for i := 1; i <= n; i++ {
		for j := 1; j <= m; j++ {
			if s[i-1] == t[j-1] {
				dp[i][j] = dp[i-1][j-1] + 1
			} else {
				dp[i][j] = max(dp[i-1][j], dp[i][j-1])
			}
		}
	}

	// 出力
	fmt.Println(dp[n][m])
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
