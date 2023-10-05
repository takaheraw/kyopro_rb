package main

import "fmt"

func main() {
	var N int64
	fmt.Scan(&N)
	A1 := N / 3
	A2 := N / 5
	A3 := N / 15
	fmt.Println(A1 + A2 - A3)
}
