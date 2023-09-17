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
	n, _ := strconv.Atoi(scanner.Text())

	scanner.Scan()
	atext := scanner.Text()
	a := make([]int, n-1)
	for i, v := range strings.Split(atext, " ") {
		a[i], _ = strconv.Atoi(v)
	}

	scanner.Scan()
	btext := scanner.Text()
	b := make([]int, n-2)
	for i, v := range strings.Split(btext, " ") {
		b[i], _ = strconv.Atoi(v)
	}

	// 動的計画法
	dp := make([]int, n+1)
	dp[1] = 0
	if n > 1 {
		dp[2] = a[0]
	}
	for i := 3; i <= n; i++ {
		dp[i] = min(dp[i-1]+a[i-2], dp[i-2]+b[i-3])
	}

	// 出力
	fmt.Println(dp[n])
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}
