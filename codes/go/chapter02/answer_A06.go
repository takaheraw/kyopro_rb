package main

import (
	"fmt"
)

func main() {
	var n, q int
	fmt.Scan(&n, &q)

	a := make([]int, n)
	for i := 0; i < n; i++ {
		fmt.Scan(&a[i])
	}

	lr := make([][2]int, q)
	for i := 0; i < q; i++ {
		fmt.Scan(&lr[i][0], &lr[i][1])
	}

	// 累積和の計算
	s := make([]int, n+1)
	for i := 1; i <= n; i++ {
		s[i] = s[i-1] + a[i-1]
	}

	// 質問に答える
	for i := 0; i < q; i++ {
		fmt.Println(s[lr[i][1]] - s[lr[i][0]-1])
	}
}
