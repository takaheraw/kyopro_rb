package main

import (
	"fmt"
)

func main() {
	var n int
	fmt.Scan(&n)

	// 上の桁から順番に「2進法に変換した値」を求める
	for x := 9; x >= 0; x-- {
		wari := 1 << x            // 2のx乗
		fmt.Print((n / wari) % 2) // 割り算の結果に応じて0または1を出力
	}
	fmt.Println()
}
