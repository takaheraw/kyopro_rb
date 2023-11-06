package main

import (
	"fmt"
	"sort"
)

func main() {
	var n int
	fmt.Scan(&n)

	t := make([]int, n)
	d := make([]int, n)

	for i := 0; i < n; i++ {
		var ti, di int
		fmt.Scan(&ti, &di)
		t[i] = ti
		d[i] = di
	}

	// D の小さい順に並べ替える
	problems := make([][2]int, n)
	for i := 0; i < n; i++ {
		problems[i] = [2]int{d[i], t[i]}
	}
	sort.Slice(problems, func(i, j int) bool {
		return problems[i][0] < problems[j][0]
	})

	for i := 0; i < n; i++ {
		d[i] = problems[i][0]
		t[i] = problems[i][1]
	}

	// 動的計画法：前準備
	maxD := 0
	for i := 0; i < n; i++ {
		if d[i] > maxD {
			maxD = d[i]
		}
	}
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, maxD+1)
	}

	for i := 0; i <= n; i++ {
		for j := 0; j <= maxD; j++ {
			dp[i][j] = -1000000000
		}
	}

	// 動的計画法
	dp[0][0] = 0
	for i := 1; i <= n; i++ {
		for j := 0; j <= maxD; j++ {
			if j > d[i-1] || j < t[i-1] {
				dp[i][j] = dp[i-1][j]
			} else {
				dp[i][j] = max(dp[i-1][j], dp[i-1][j-t[i-1]]+1)
			}
		}
	}

	// 答えを求めて出力
	answer := 0
	for j := 0; j <= maxD; j++ {
		if dp[n][j] > answer {
			answer = dp[n][j]
		}
	}
	fmt.Println(answer)
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
