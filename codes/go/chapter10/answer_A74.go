package main

import "fmt"

func main() {
	var n int
	fmt.Scan(&n)

	p := make([][]int, n+1)
	for i := 1; i <= n; i++ {
		p[i] = make([]int, n+1)
		for j := 1; j <= n; j++ {
			fmt.Scan(&p[i][j])
		}
	}

	x := make([]int, n+1)
	y := make([]int, n+1)

	for i := 1; i <= n; i++ {
		for j := 1; j <= n; j++ {
			if p[i][j] != 0 {
				x[i] = p[i][j]
				y[j] = p[i][j]
			}
		}
	}

	inversion_x := 0
	inversion_y := 0

	for i := 1; i <= n; i++ {
		for j := i + 1; j <= n; j++ {
			if x[i] > x[j] {
				inversion_x++
			}
			if y[i] > y[j] {
				inversion_y++
			}
		}
	}

	// 出力
	fmt.Println(inversion_x + inversion_y)
}
