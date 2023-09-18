package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	// 入力（A, B が 0 番目から始まっていることに注意）
	scanner.Scan()
	N, _ := strconv.Atoi(scanner.Text())

	scanner.Scan()
	Atext := scanner.Text()
	A := make([]int, N-1)
	for i, v := range strings.Split(Atext, " ") {
		A[i], _ = strconv.Atoi(v)
	}

	scanner.Scan()
	Btext := scanner.Text()
	B := make([]int, N-2)
	for i, v := range strings.Split(Btext, " ") {
		B[i], _ = strconv.Atoi(v)
	}

	// 動的計画法
	dp := make([]int, N+1)
	dp[1] = 0
	if N > 1 {
		dp[2] = A[0]
	}
	for i := 3; i <= N; i++ {
		dp[i] = min(dp[i-1]+A[i-2], dp[i-2]+B[i-3])
	}

	// 答えの復元
	Answer := []int{}
	Place := N
	for {
		Answer = append(Answer, Place)
		if Place == 1 {
			break
		}

		// どこから部屋 Place に向かうのが最適かを求める
		if dp[Place-1]+A[Place-2] == dp[Place] {
			Place = Place - 1
		} else {
			Place = Place - 2
		}
	}

	// 答えを出力
	reverse(Answer)
	fmt.Println(len(Answer))
	for i, val := range Answer {
		if i == 0 {
			fmt.Print(val)
		} else {
			fmt.Printf(" %d", val)
		}
	}
	fmt.Println()
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func reverse(s []int) {
	for i, j := 0, len(s)-1; i < j; i, j = i+1, j-1 {
		s[i], s[j] = s[j], s[i]
	}
}
