package main

import (
	"fmt"
)

func main() {
	var d, n int
	fmt.Scan(&d, &n)

	lr := make([][2]int, n)
	for i := 0; i < n; i++ {
		fmt.Scan(&lr[i][0], &lr[i][1])
	}

	// 前日比に加算
	b := make([]int, d+2)

	for _, lrVal := range lr {
		b[lrVal[0]]++
		b[lrVal[1]+1]--
	}

	// 累積和をとる
	answer := make([]int, d+2)
	answer[0] = 0

	for i := 1; i <= d; i++ {
		answer[i] = answer[i-1] + b[i]
	}

	// 出力
	for i := 1; i <= d; i++ {
		fmt.Println(answer[i])
	}
}
