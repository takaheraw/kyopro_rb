package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	var N, M int
	fmt.Scan(&N, &M)

	A := make([]int, M+1)
	B := make([]int, M+1)
	G := make([][]int, N+1)
	for i := 1; i <= N; i++ {
		G[i] = []int{}
	}

	for i := 1; i <= M; i++ {
		fmt.Scan(&A[i], &B[i])
		G[A[i]] = append(G[A[i]], B[i])
		G[B[i]] = append(G[B[i]], A[i])
	}

	dist := make([]int, N+1)
	for i := 1; i <= N; i++ {
		dist[i] = -1
	}
	dist[1] = 0

	Q := []int{1}
	for len(Q) > 0 {
		pos := Q[0]
		Q = Q[1:]
		for _, nex := range G[pos] {
			if dist[nex] == -1 {
				dist[nex] = dist[pos] + 1
				Q = append(Q, nex)
			}
		}
	}

	wr := bufio.NewWriter(os.Stdout)
	for i := 1; i <= N; i++ {
		fmt.Fprintln(wr, dist[i])
	}
	wr.Flush()
}
