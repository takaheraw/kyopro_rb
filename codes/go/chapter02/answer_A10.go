package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	// 入力（前半部分）
	scanner.Scan()
	n, _ := strconv.Atoi(scanner.Text())
	scanner.Scan()
	a := make([]int, n)
	for i, v := range strings.Split(scanner.Text(), " ") {
		a[i], _ = strconv.Atoi(v)
	}

	// 入力（後半部分）
	scanner.Scan()
	d, _ := strconv.Atoi(scanner.Text())
	l := make([]int, d)
	r := make([]int, d)
	for i := 0; i < d; i++ {
		scanner.Scan()
		lr := strings.Split(scanner.Text(), " ")
		l[i], _ = strconv.Atoi(lr[0])
		r[i], _ = strconv.Atoi(lr[1])
	}

	// P[i]を求める
	p := make([]int, n)
	p[0] = a[0]
	for i := 1; i < n; i++ {
		p[i] = max(p[i-1], a[i])
	}

	// Q[i]を求める
	q := make([]int, n)
	q[n-1] = a[n-1]
	for i := n - 2; i >= 0; i-- {
		q[i] = max(q[i+1], a[i])
	}

	// それぞれの日について答えを求める
	for i := 0; i < d; i++ {
		var lValue *int
		if l[i]-2 >= 0 {
			lValue = &p[l[i]-2]
		}
		rValue := q[r[i]-1]

		if lValue == nil {
			fmt.Println(rValue)
		} else {
			fmt.Println(max(*lValue, rValue))
		}
	}
}

func max(x, y int) int {
	if x > y {
		return x
	}
	return y
}
