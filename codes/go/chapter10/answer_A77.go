package main

import (
	"fmt"
)

// check 関数: スコアの最大値が x 以上かを判定
func check(x int, n int, l int, k int, a []int) bool {
	cnt := 0
	lastKireme := 0
	for i := 0; i < n; i++ {
		if a[i]-lastKireme >= x && l-a[i] >= x {
			cnt++
			lastKireme = a[i]
		}
	}
	return cnt >= k
}

func main() {
	var n, l, k int
	fmt.Scan(&n, &l)
	fmt.Scan(&k)

	a := make([]int, n)
	for i := 0; i < n; i++ {
		fmt.Scan(&a[i])
	}

	left, right := 1, 1000000000
	for left < right {
		mid := (left + right + 1) / 2
		answer := check(mid, n, l, k, a)
		if !answer {
			right = mid - 1
		} else {
			left = mid
		}
	}

	fmt.Println(left)
}
