package main

import "fmt"

func main() {
	var N, A, B int
	fmt.Scan(&N, &A, &B)

	dp := make([]bool, N+1)

	for i := 0; i <= N; i++ {
		if i >= A && !dp[i-A] {
			dp[i] = true
		} else if i >= B && !dp[i-B] {
			dp[i] = true
		} else {
			dp[i] = false
		}
	}

	if dp[N] {
		fmt.Println("First")
	} else {
		fmt.Println("Second")
	}
}
