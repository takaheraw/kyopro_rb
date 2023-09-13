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

	// 入力
	scanner.Scan()
	nk := strings.Split(scanner.Text(), " ")
	n, _ := strconv.Atoi(nk[0])
	k, _ := strconv.Atoi(nk[1])

	scanner.Scan()
	aText := scanner.Text()
	aTexts := strings.Split(aText, " ")
	a := make([]int, n)
	for i, v := range aTexts {
		a[i], _ = strconv.Atoi(v)
	}

	// 二分探索
	// Left は探索範囲の左端を、Right は探索範囲の右端を表す
	left := 1
	right := 1000000000
	for left < right {
		mid := (left + right) / 2
		answer := check(mid, n, k, a)

		if !answer {
			left = mid + 1 // 答えが Mid+1 以上であることが分かる
		} else {
			right = mid // 答えが Mid 以下であることが分かる
		}
	}

	// 出力（このとき Left=Right になっている）
	fmt.Println(left)
}

// 答えが x 以下かを判定し、Yes であれば true、No であれば false を返す関数
func check(x int, n int, k int, a []int) bool {
	sum := 0
	for i := 0; i < n; i++ {
		sum += x / a[i] // 「x÷a[i]」の小数点以下切り捨て
	}

	return sum >= k
}
