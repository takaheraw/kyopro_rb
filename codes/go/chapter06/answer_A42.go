package main

import (
	"fmt"
)

func main() {
	var N, K int
	fmt.Scan(&N, &K)
	A := make([]int, N+1)
	B := make([]int, N+1)
	for i := 1; i <= N; i++ {
		fmt.Scan(&A[i], &B[i])
	}

	// (a, b) の組を全探索
	var Answer int
	for a := 1; a <= 100; a++ {
		for b := 1; b <= 100; b++ {
			Score := GetScore(a, b, N, K, A, B)
			if Score > Answer {
				Answer = Score
			}
		}
	}

	// 出力
	fmt.Println(Answer)
}

// 整数の組 (a, b) が決まったときの、参加可能な生徒数を返す関数
func GetScore(a int, b int, N int, K int, A []int, B []int) int {
	cnt := 0
	for i := 1; i <= N; i++ {
		if a <= A[i] && A[i] <= a+K && b <= B[i] && B[i] <= b+K {
			cnt += 1
		}
	}
	return cnt
}
