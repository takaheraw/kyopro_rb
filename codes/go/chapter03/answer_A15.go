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
	N, _ := strconv.Atoi(scanner.Text())

	scanner.Scan()
	Atext := strings.Split(scanner.Text(), " ")
	A := make([]int, N)
	for i, v := range Atext {
		A[i], _ = strconv.Atoi(v)
	}

	// 配列 T の作成（重複も消す）
	Tmap := make(map[int]bool)
	for _, v := range A {
		Tmap[v] = true
	}
	T := make([]int, 0, len(Tmap))
	for k := range Tmap {
		T = append(T, k)
	}
	sort.Ints(T)

	// 答えを求める
	B := make([]int, N)
	for i, v := range A {
		B[i] = sort.SearchInts(T, v) + 1
	}

	// 答えを空白区切りで出力
	for i, v := range B {
		if i == 0 {
			fmt.Print(v)
		} else {
			fmt.Printf(" %d", v)
		}
	}
	fmt.Println()
}
