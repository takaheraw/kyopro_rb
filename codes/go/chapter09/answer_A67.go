package main

import (
	"fmt"
	"sort"
)

type UnionFind struct {
	parent []int
	size   []int
}

func newUnionFind(n int) *UnionFind {
	parent := make([]int, n+1)
	size := make([]int, n+1)
	for i := 1; i <= n; i++ {
		parent[i] = -1
		size[i] = 1
	}
	return &UnionFind{parent, size}
}

func (uf *UnionFind) root(x int) int {
	for uf.parent[x] != -1 {
		x = uf.parent[x]
	}
	return x
}

func (uf *UnionFind) unite(u, v int) {
	rootU := uf.root(u)
	rootV := uf.root(v)
	if rootU == rootV {
		return
	}

	if uf.size[rootU] < uf.size[rootV] {
		uf.parent[rootU] = rootV
		uf.size[rootV] += uf.size[rootU]
	} else {
		uf.parent[rootV] = rootU
		uf.size[rootU] += uf.size[rootV]
	}
}

func (uf *UnionFind) same(u, v int) bool {
	return uf.root(u) == uf.root(v)
}

type Edge struct {
	a, b, c, idx int
}

func main() {
	var n, m int
	fmt.Scanf("%d %d", &n, &m)

	edges := make([]Edge, m)
	for i := 0; i < m; i++ {
		var a, b, c int
		fmt.Scanf("%d %d %d", &a, &b, &c)
		edges[i] = Edge{a, b, c, i + 1}
	}

	// 辺の長さの小さい順にソート
	sort.Slice(edges, func(i, j int) bool {
		return edges[i].c < edges[j].c
	})

	answer := 0
	uf := newUnionFind(n)

	for _, edge := range edges {
		if !uf.same(edge.a, edge.b) {
			uf.unite(edge.a, edge.b)
			answer += edge.c
		}
	}

	fmt.Println(answer)
}
