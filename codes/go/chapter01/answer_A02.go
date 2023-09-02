package main

import "fmt"

func main() {
	var N, X int
	fmt.Scan(&N, &X)

	A := make([]int, N)
	for i := 0; i < N; i++ {
		fmt.Scan(&A[i])
	}

	answer := false
	for i := 0; i < N; i++ {
		if A[i] == X {
			answer = true
			break
		}
	}

	if answer {
		fmt.Println("Yes")
	} else {
		fmt.Println("No")
	}
}
