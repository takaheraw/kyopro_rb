package main

import "fmt"

func main() {
	var N int
	fmt.Scan(&N)
	A := make([]int, N)
	for i := 0; i < N; i++ {
		fmt.Scan(&A[i])
	}

	// 全部 XOR した値（ニム和）を求める
	XOR_Sum := A[0]
	for i := 1; i < N; i++ {
		XOR_Sum ^= A[i]
	}

	// 出力
	if XOR_Sum >= 1 {
		fmt.Println("First")
	} else {
		fmt.Println("Second")
	}
}
