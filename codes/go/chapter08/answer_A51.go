package main

import (
	"fmt"
)

func main() {
	// 入力
	var Q int
	fmt.Scan(&Q)
	queryType := make([]int, Q+1)
	x := make([]string, Q+1)
	for i := 1; i <= Q; i++ {
		fmt.Scan(&queryType[i])
		if queryType[i] == 1 {
			fmt.Scan(&x[i])
		}
	}

	// クエリの処理
	S := []string{}
	for i := 1; i <= Q; i++ {
		if queryType[i] == 1 {
			S = append(S, x[i])
		}
		if queryType[i] == 2 {
			fmt.Println(S[len(S)-1])
		}
		if queryType[i] == 3 {
			S = S[:len(S)-1]
		}
	}
}
