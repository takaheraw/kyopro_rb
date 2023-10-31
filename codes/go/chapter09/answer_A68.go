package main

import "fmt"

type FlowEdge struct {
	to  int
	cap int
	rev int
}

type MaximumFlow struct {
	n    int
	used []bool
	g    [][]FlowEdge
}

func newMaximumFlow(n int) *MaximumFlow {
	mf := MaximumFlow{
		n:    n,
		used: make([]bool, n+1),
		g:    make([][]FlowEdge, n+1),
	}

	for i := 0; i <= n; i++ {
		mf.g[i] = make([]FlowEdge, 0)
	}

	return &mf
}

func (mf *MaximumFlow) addEdge(a, b, c int) {
	mf.g[a] = append(mf.g[a], FlowEdge{b, c, len(mf.g[b])})
	mf.g[b] = append(mf.g[b], FlowEdge{a, 0, len(mf.g[a]) - 1})
}

func (mf *MaximumFlow) dfs(pos, goal, f int) int {
	if pos == goal {
		return f
	}

	mf.used[pos] = true
	for i, e := range mf.g[pos] {
		if e.cap == 0 || mf.used[e.to] {
			continue
		}
		flow := mf.dfs(e.to, goal, min(f, e.cap))
		if flow > 0 {
			mf.g[pos][i].cap -= flow
			mf.g[e.to][e.rev].cap += flow
			return flow
		}
	}
	return 0
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func (mf *MaximumFlow) maxFlow(s, t int) int {
	totalFlow := 0
	for {
		for i := 0; i <= mf.n; i++ {
			mf.used[i] = false
		}
		f := mf.dfs(s, t, int(^uint(0)>>1)) // Equivalent to Float64(INFINITY) in Ruby
		if f == 0 {
			break
		}
		totalFlow += f
	}
	return totalFlow
}

func main() {
	var n, m int
	fmt.Scanf("%d %d", &n, &m)
	z := newMaximumFlow(n)
	for i := 0; i < m; i++ {
		var a, b, c int
		fmt.Scanf("%d %d %d", &a, &b, &c)
		z.addEdge(a, b, c)
	}
	result := z.maxFlow(1, n)
	fmt.Println(result)
}
