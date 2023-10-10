package main

import (
	"fmt"
)

func main() {
	var N, K int
	fmt.Scan(&N, &K)

	if K >= 2*N-2 && K%2 == 0 {
		fmt.Println("Yes")
	} else {
		fmt.Println("No")
	}
}
