package main

import (
	"fmt"
)

func main() {
	// 入力
	var n int
	fmt.Scan(&n)
	p := make([]int, n+1)
	a := make([]int, n+1)

	for i := 1; i <= n; i++ {
		fmt.Scan(&p[i])
		fmt.Scan(&a[i])
	}

	// 動的計画法
	dp := make([][]int, n+2)
	for i := 0; i <= n+1; i++ {
		dp[i] = make([]int, n+2)
	}

	// 動的計画法のループ
	for lEN := 1; lEN <= n; lEN++ {
		for l := 1; l <= n-lEN+1; l++ {
			r := l + lEN - 1

			// score1 の値（l-1 番目のブロックを取り除くときの得点）を求める
			score1 := 0
			if l >= 2 && l <= p[l-1] && p[l-1] <= r {
				score1 = a[l-1]
			}

			// score2 の値（r+1 番目のブロックを取り除くときの得点）を求める
			score2 := 0
			if r <= n && l <= p[r] && p[r] <= r {
				score2 = a[r]
			}

			// dp[l][r] を求める
			if l == 1 {
				dp[l][r] = dp[l][r+1] + score2
			} else if r == n {
				dp[l][r] = dp[l-1][r] + score1
			} else {
				dp[l][r] = max(dp[l-1][r]+score1, dp[l][r+1]+score2)
			}
		}
	}

	// 出力
	answer := 0
	for i := 1; i <= n; i++ {
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
