package main

import (
	"fmt"
)

func main() {
	var N int
	var C string
	var A string
	fmt.Scan(&N, &C, &A)

	score := 0
	for i := 0; i < N; i++ {
		if A[i] == 'W' {
			score += 0
		} else if A[i] == 'B' {
			score += 1
		} else if A[i] == 'R' {
			score += 2
		}
	}

	if score%3 == 0 && C == "W" {
		fmt.Println("Yes")
	} else if score%3 == 1 && C == "B" {
		fmt.Println("Yes")
	} else if score%3 == 2 && C == "R" {
		fmt.Println("Yes")
	} else {
		fmt.Println("No")
	}
}
