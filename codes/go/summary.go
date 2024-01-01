package main

import (
	"fmt"
	"math/rand"
)

func quicksort(arr []int) []int {
	if len(arr) <= 1 {
		return arr
	}

	pivot := arr[rand.Intn(len(arr))]

	var less, equal, greater []int

	for _, x := range arr {
		switch {
		case x < pivot:
			less = append(less, x)
		case x == pivot:
			equal = append(equal, x)
		case x > pivot:
			greater = append(greater, x)
		}
	}

	return append(append(quicksort(less), equal...), quicksort(greater)...)
}

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

	fmt.Println("クイックソート")

	arrayToSort := []int{3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5}
	sortedArray := quicksort(arrayToSort)

	fmt.Println(sortedArray)
}
