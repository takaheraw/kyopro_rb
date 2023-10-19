package main

import (
	"fmt"
)

func main() {
	var N, Q int
	fmt.Scan(&N, &Q)

	// 配列の初期化
	State := 1
	E := make([]int, N+1)
	for i := 1; i <= N; i++ {
		E[i] = i
	}

	// クエリの処理
	for i := 1; i <= Q; i++ {
		var Type, x, y int
		fmt.Scan(&Type)

		// [1] 変更操作
		if Type == 1 {
			fmt.Scan(&x, &y)
			if State == 1 {
				E[x] = y
			}
			if State == 2 {
				E[N+1-x] = y
			}
		}

		// [2] 反転操作
		if Type == 2 {
			if State == 1 {
				State = 2
			} else {
				State = 1
			}
		}

		// [3] 取得操作
		if Type == 3 {
			fmt.Scan(&x)
			if State == 1 {
				fmt.Println(E[x])
			}
			if State == 2 {
				fmt.Println(E[N+1-x])
			}
		}
	}
}
