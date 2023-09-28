package main

import (
	"fmt"
)

func main() {
	var n int
	fmt.Scan(&n)
	a := make([]int, n)
	for i := 0; i < n; i++ {
		fmt.Scan(&a[i])
	}

	len := 0
	l := make([]int, n)
	dp := make([]int, n)

	for i := 0; i < n; i++ {
		pos := binarySearch(l, a[i], len)
		dp[i] = pos

		if dp[i] >= len {
			l[len] = a[i]
			len++
		} else {
			l[dp[i]] = a[i]
		}
	}

	fmt.Println(len)
}

func binarySearch(l []int, target int, len int) int {
	left := 0
	right := len
	for left < right {
		mid := (left + right) / 2
		if l[mid] < target {
			left = mid + 1
		} else {
			right = mid
		}
	}
	return left
}
