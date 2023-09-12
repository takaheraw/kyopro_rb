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

	// 入力（配列 X が 0 番目から始まることに注意）
	scanner.Scan()
	nx := strings.Split(scanner.Text(), " ")
	n, _ := strconv.Atoi(nx[0])
	x, _ := strconv.Atoi(nx[1])

	scanner.Scan()
	aText := scanner.Text()
	aTexts := strings.Split(aText, " ")
	a := make([]int, n)
	for i, v := range aTexts {
		a[i], _ = strconv.Atoi(v)
	}

	// 二分探索を行う（配列が 0 番目から始まるので、答えに 1 を足している）
	answer := search(x, a)
	fmt.Println(answer + 1)
}

// 整数 x が何番目に存在するかを返す関数
func search(x int, a []int) int {
	l, r := 0, len(a)-1
	for l <= r {
		m := (l + r) / 2
		if x < a[m] {
			r = m - 1
		} else if x == a[m] {
			return m
		} else {
			l = m + 1
		}
	}
	return -1 // 整数 x が存在しない（注：この問題の制約で -1 が返されることはない）
}
