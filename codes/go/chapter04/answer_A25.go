package main

import (
	"fmt"
)

func main() {
	var h, w int
	fmt.Scan(&h, &w)
	c := make([]string, h)
	for i := 0; i < h; i++ {
		fmt.Scan(&c[i])
	}

	dp := make([][]int, h)
	for i := 0; i < h; i++ {
		dp[i] = make([]int, w)
	}

	for i := 0; i < h; i++ {
		for j := 0; j < w; j++ {
			if i == 0 && j == 0 {
				dp[i][j] = 1
			} else {
				dp[i][j] = 0
				if i >= 1 && c[i-1][j] == '.' {
					dp[i][j] += dp[i-1][j]
				}
				if j >= 1 && c[i][j-1] == '.' {
					dp[i][j] += dp[i][j-1]
				}
			}
		}
	}

	fmt.Println(dp[h-1][w-1])
}
