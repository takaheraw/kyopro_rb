package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	var n int
	fmt.Scan(&n)

	a := make([]int, n+1)
	for i := 2; i <= n; i++ {
		fmt.Scan(&a[i])
	}

	g := make([][]int, n+1)
	for i := 2; i <= n; i++ {
		g[a[i]] = append(g[a[i]], i)
	}

	dp := make([]int, n+1)
	for i := n; i >= 1; i-- {
		for _, j := range g[i] {
			dp[i] += (dp[j] + 1)
		}
	}

	w := bufio.NewWriter(os.Stdout)
	defer w.Flush()
	for _, v := range dp[1:] {
		fmt.Fprintf(w, "%d ", v)
	}
}
