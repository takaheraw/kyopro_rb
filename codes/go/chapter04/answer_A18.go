package main

import (
	"fmt"
)

func main() {
	// 入力
	fmt.Print("N, S: ")
	n, s := 0, 0
	fmt.Scan(&n, &s)
	a := []int{}
	for i := 0; i < n; i++ {
		v := 0
		fmt.Scan(&v)
		a = append(a, v)
	}

	// 動的計画法（i=0）
	dp := make([][]bool, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]bool, s+1)
		dp[i][0] = true
	}

	// 動的計画法（i=1）
	for i := 1; i <= n; i++ {
		for j := 0; j <= s; j++ {
			if j < a[i-1] {
				dp[i][j] = dp[i-1][j]
			} else {
				dp[i][j] = dp[i-1][j] || dp[i-1][j-a[i-1]]
			}
		}
	}

	// 出力
	if dp[n][s] {
		fmt.Println("Yes")
	} else {
		fmt.Println("No")
	}
}
