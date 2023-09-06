package main

import (
	"fmt"
)

func main() {
	var n, k int
	fmt.Scan(&n, &k)

	// 全探索
	answer := 0
	for x := 1; x <= n; x++ {
		for y := 1; y <= n; y++ {
			z := k - x - y // 白いカードに書かれるべき整数
			if z >= 1 && z <= n {
				answer++
			}
		}
	}

	// 出力
	fmt.Println(answer)
}
