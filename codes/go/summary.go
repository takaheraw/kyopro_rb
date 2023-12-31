package main

import "fmt"

func main() {
	fmt.Println("累積和")

	visitors := []int{62, 65, 41, 13, 20, 11, 18, 44, 53, 12, 18, 17, 14, 10, 39}
	accumulates := make([]int, len(visitors)+1)

	for i := 1; i <= len(visitors); i++ {
		accumulates[i] = accumulates[i-1] + visitors[i-1]
	}

	targets := [][]int{{2, 4}, {4, 13}}

	for _, pair := range targets {
		l, r := pair[0], pair[1]
		fmt.Println(accumulates[r] - accumulates[l-1])
	}
}
