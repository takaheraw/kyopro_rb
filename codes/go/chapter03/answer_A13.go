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

	// 入力（A は 0 番目から始まることに注意）
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

	// 配列の準備（R は 0 番目から始まることに注意）
	R := make([]int, n)

	// しゃくとり法
	for i := 0; i < n-1; i++ {
		// スタート地点を決める
		if i == 0 {
			R[i] = 0
		} else {
			R[i] = R[i-1]
		}

		// ギリギリまで増やしていく
		for R[i] < n-1 && a[R[i]+1]-a[i] <= k {
			R[i]++
		}
	}

	// 出力
	answer := 0
	for i := 0; i < n-1; i++ {
		answer += (R[i] - i)
	}
	fmt.Println(answer)
}
