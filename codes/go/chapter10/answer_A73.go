package main

import (
	"container/heap"
	"fmt"
	"os"
)

type Edge struct {
	to   int
	cost int
}

type State struct {
	dist int
	pos  int
}

type PriorityQueue []State

func (pq PriorityQueue) Len() int { return len(pq) }

func (pq PriorityQueue) Less(i, j int) bool {
	return pq[i].dist < pq[j].dist
}

func (pq PriorityQueue) Swap(i, j int) {
	pq[i], pq[j] = pq[j], pq[i]
}

func (pq *PriorityQueue) Push(x interface{}) {
	*pq = append(*pq, x.(State))
}

func (pq *PriorityQueue) Pop() interface{} {
	old := *pq
	n := len(old)
	item := old[n-1]
	*pq = old[0 : n-1]
	return item
}

func main() {
	var n, m int
	fmt.Fscan(os.Stdin, &n, &m)

	edges := make([][]Edge, n+1)

	for i := 0; i < m; i++ {
		var a, b, c, d int
		fmt.Fscan(os.Stdin, &a, &b, &c, &d)

		var cost int
		if d == 1 {
			cost = 10000*c - 1
		} else {
			cost = 10000 * c
		}

		edges[a] = append(edges[a], Edge{to: b, cost: cost})
		edges[b] = append(edges[b], Edge{to: a, cost: cost})
	}

	INF := int(1 << 60)
	cur := make([]int, n+1)
	for i := range cur {
		cur[i] = INF
	}
	kakutei := make([]bool, n+1)

	cur[1] = 0
	queue := make(PriorityQueue, 0)
	heap.Init(&queue)
	heap.Push(&queue, State{dist: cur[1], pos: 1})

	for len(queue) > 0 {
		state := heap.Pop(&queue).(State)
		pos := state.pos
		if kakutei[pos] {
			continue
		}
		kakutei[pos] = true
		for _, edge := range edges[pos] {
			if cur[edge.to] > cur[pos]+edge.cost {
				cur[edge.to] = cur[pos] + edge.cost
				heap.Push(&queue, State{dist: cur[edge.to], pos: edge.to})
			}
		}
	}

	distance := (cur[n] + 9999) / 10000
	numTrees := distance*10000 - cur[n]

	fmt.Printf("%d %d\n", distance, numTrees)
}
