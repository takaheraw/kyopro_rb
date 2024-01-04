package main

import (
	"fmt"
	"math"
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

func binarySearch(arr []int, target int) int {
	low, high := 0, len(arr)-1

	for low <= high {
		mid := (low + high) / 2
		if arr[mid] == target {
			return mid
		} else if arr[mid] < target {
			low = mid + 1
		} else {
			high = mid - 1
		}
	}

	return -1 // ターゲットが見つからなかった場合は-1を返す（Rubyのnilに相当）
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func isPrime(n int) bool {
	limit := int(math.Sqrt(float64(n)))
	for i := 2; i <= limit; i++ {
		if n%i == 0 {
			return false
		}
	}
	return true
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

	fmt.Println("二分探索")

	target := 5

	index := binarySearch(sortedArray, target)
	fmt.Println(index)

	fmt.Println("動的計画法")

	roomCount := 5
	pattern1 := []int{2, 4, 1, 3}
	pattern2 := []int{5, 3, 7}

	dp := make([]int, roomCount+1)
	dp[1] = 0
	dp[2] = pattern1[0]

	for i := 3; i <= roomCount; i++ {
		dp[i] = min(dp[i-1]+pattern1[i-2], dp[i-2]+pattern2[i-3])
	}

	fmt.Println(dp[roomCount])

	fmt.Println("素数")
	fmt.Println(isPrime(17))
	fmt.Println(isPrime(35))
}
