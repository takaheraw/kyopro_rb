package main

import (
	"fmt"
	"strings"
)

func main() {
	var h, w, n int
	fmt.Scan(&h, &w, &n)

	a := make([]int, n)
	b := make([]int, n)
	c := make([]int, n)
	d := make([]int, n)

	for i := 0; i < n; i++ {
		fmt.Scan(&a[i], &b[i], &c[i], &d[i])
	}

	// 各日について加算
	x := make([][]int, h+2)
	for i := range x {
		x[i] = make([]int, w+2)
	}

	z := make([][]int, h+2)
	for i := range z {
		z[i] = make([]int, w+2)
	}

	for t := 0; t < n; t++ {
		x[a[t]][b[t]] += 1
		x[a[t]][d[t]+1] -= 1
		x[c[t]+1][b[t]] -= 1
		x[c[t]+1][d[t]+1] += 1
	}

	// 二次元累積和を求める
	for i := 1; i <= h; i++ {
		for j := 1; j <= w; j++ {
			z[i][j] = z[i][j-1] + x[i][j]
		}
	}

	for j := 1; j <= w; j++ {
		for i := 1; i <= h; i++ {
			z[i][j] += z[i-1][j]
		}
	}

	// 出力
	for i := 1; i <= h; i++ {
		results := make([]string, w)
		for j := 1; j <= w; j++ {
			results[j-1] = fmt.Sprintf("%d", z[i][j])
		}
		fmt.Println(strings.Join(results, " "))
	}
}
