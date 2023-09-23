package main

import (
	"fmt"
	"math"
)

type Item struct {
	Weight int
	Value  int
}

func main() {
	// 入力
	var N, W int
	fmt.Scanln(&N, &W)
	items := make([]Item, N+1)
	for i := 1; i <= N; i++ {
		fmt.Scanln(&items[i].Weight, &items[i].Value)
	}

	// 動的計画法
	dp := make([][]int, N+1)
	for i := range dp {
		dp[i] = make([]int, W+1)
		for j := range dp[i] {
			dp[i][j] = math.MinInt
		}
	}
	dp[0][0] = 0
	for i := 1; i <= N; i++ {
		for j := 0; j <= W; j++ {
			if j < items[i].Weight {
				dp[i][j] = dp[i-1][j]
			} else {
				dp[i][j] = max(dp[i-1][j], dp[i-1][j-items[i].Weight]+items[i].Value)
			}
		}
	}

	// 出力
	fmt.Println(dp[N][W])
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
