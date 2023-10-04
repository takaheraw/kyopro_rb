package main

import "fmt"

// Power returns a^b mod m
func Power(a, b, m int) int {
	p := a
	Answer := 1
	for i := 0; i < 30; i++ {
		wari := 1 << uint(i)
		if (b/wari)%2 == 1 {
			Answer = (Answer * p) % m // a の 2^i 乗が掛けられるとき
		}
		p = (p * p) % m
	}
	return Answer
}

// Division returns a/b mod m
func Division(a, b, m int) int {
	return (a * Power(b, m-2, m)) % m
}

func main() {
	var n, r int
	fmt.Scan(&n, &r)
	M := 1000000007

	// 手順 1：分子を求める
	a := 1
	for i := 1; i <= n; i++ {
		a = (a * i) % M
	}

	// 手順 2：分母を求める
	b := 1
	for i := 1; i <= r; i++ {
		b = (b * i) % M
	}
	for i := 1; i <= n-r; i++ {
		b = (b * i) % M
	}

	// 手順 3：答えを求める
	fmt.Println(Division(a, b, M))
}
