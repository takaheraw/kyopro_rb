package main

import (
	"fmt"
)

func main() {
	var N, X, Y int
	fmt.Scan(&N, &X, &Y)
	A := make([]int, N)
	for i := 0; i < N; i++ {
		fmt.Scan(&A[i])
	}

	grundy := make([]int, 100001)
	for i := 0; i < 100001; i++ {
		Transit := [3]bool{false, false, false}
		if i >= X {
			Transit[grundy[i-X]] = true
		}
		if i >= Y {
			Transit[grundy[i-Y]] = true
		}

		if Transit[0] == false {
			grundy[i] = 0
		} else if Transit[1] == false {
			grundy[i] = 1
		} else {
			grundy[i] = 2
		}
	}

	XOR_Sum := 0
	for i := 0; i < N; i++ {
		XOR_Sum ^= grundy[A[i]]
	}
	if XOR_Sum >= 1 {
		fmt.Println("First")
	} else {
		fmt.Println("Second")
	}
}
