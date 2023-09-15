package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
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
	aText := strings.Split(scanner.Text(), " ")
	a := make([]int, n)
	for i, v := range aText {
		a[i], _ = strconv.Atoi(v)
	}

	scanner.Scan()
	bText := strings.Split(scanner.Text(), " ")
	b := make([]int, n)
	for i, v := range bText {
		b[i], _ = strconv.Atoi(v)
	}

	scanner.Scan()
	cText := strings.Split(scanner.Text(), " ")
	c := make([]int, n)
	for i, v := range cText {
		c[i], _ = strconv.Atoi(v)
	}

	scanner.Scan()
	dText := strings.Split(scanner.Text(), " ")
	d := make([]int, n)
	for i, v := range dText {
		d[i], _ = strconv.Atoi(v)
	}

	// 配列 P を作成
	p := make([]int, n*n)
	index := 0
	for x := 0; x < n; x++ {
		for y := 0; y < n; y++ {
			p[index] = a[x] + b[y]
			index++
		}
	}

	// 配列 Q を作成
	q := make([]int, n*n)
	index = 0
	for z := 0; z < n; z++ {
		for w := 0; w < n; w++ {
			q[index] = c[z] + d[w]
			index++
		}
	}

	// 配列 Q を小さい順にソート
	sort.Ints(q)

	// 二分探索
	for i := 0; i < len(p); i++ {
		pos1 := sort.SearchInts(q, k-p[i])
		if pos1 < n*n && q[pos1] == k-p[i] {
			fmt.Println("Yes")
			return
		}
	}

	// 見つからなかった場合
	fmt.Println("No")
}
