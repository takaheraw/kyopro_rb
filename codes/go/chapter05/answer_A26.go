package main

import (
	"fmt"
	"math/big"
)

func isPrime(x int64) bool {
	return big.NewInt(x).ProbablyPrime(0)
}

func main() {
	var q int
	fmt.Scan(&q)
	x := make([]int64, q)
	for i := 0; i < q; i++ {
		fmt.Scan(&x[i])
	}
	for i := 0; i < q; i++ {
		answer := isPrime(x[i])
		if answer == true {
			fmt.Println("Yes")
		} else {
			fmt.Println("No")
		}
	}
}
