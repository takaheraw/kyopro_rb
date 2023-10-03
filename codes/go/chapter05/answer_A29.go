package main

import (
	"fmt"
)

func main() {
	var a, b int64
	fmt.Scan(&a, &b)
	fmt.Println(Power(a, b, 1000000007))
}

func Power(a, b, m int64) int64 {
	p := a
	answer := int64(1)
	for i := 0; i < 30; i++ {
		wari := int64(1 << i)
		if (b/wari)%2 == 1 {
			answer = (answer * p) % m
		}
		p = (p * p) % m
	}
	return answer
}
