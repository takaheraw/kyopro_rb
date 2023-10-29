package main

import (
	"bufio"
	"fmt"
	"os"
)

type UnionFind struct {
	n    int
	par  []int
	size []int
}

func NewUnionFind(n int) *UnionFind {
	uf := new(UnionFind)
	uf.n = n
	uf.par = make([]int, n+1)
	uf.size = make([]int, n+1)
	for i := 0; i <= n; i++ {
		uf.par[i] = -1
		uf.size[i] = 1
	}
	return uf
}

func (uf *UnionFind) root(x int) int {
	for uf.par[x] != -1 {
		x = uf.par[x]
	}
	return x
}

func (uf *UnionFind) unite(u, v int) {
	rootu := uf.root(u)
	rootv := uf.root(v)
	if rootu != rootv {
		if uf.size[rootu] < uf.size[rootv] {
			uf.par[rootu] = rootv
			uf.size[rootv] += uf.size[rootu]
		} else {
			uf.par[rootv] = rootu
			uf.size[rootu] += uf.size[rootv]
		}
	}
}

func (uf *UnionFind) same(u, v int) bool {
	return uf.root(u) == uf.root(v)
}

func main() {
	var n, q int
	fmt.Scan(&n, &q)

	queries := make([][]int, q)
	scanner := bufio.NewScanner(os.Stdin)
	for i := 0; i < q; i++ {
		scanner.Scan()
		query := make([]int, 3)
		fmt.Sscanf(scanner.Text(), "%d %d %d", &query[0], &query[1], &query[2])
		queries[i] = query
	}

	// クエリの処理
	uf := NewUnionFind(n)
	for _, query := range queries {
		tp, u, v := query[0], query[1], query[2]
		if tp == 1 {
			uf.unite(u, v)
		} else if tp == 2 {
			if uf.same(u, v) {
				fmt.Println("Yes")
			} else {
				fmt.Println("No")
			}
		}
	}
}
