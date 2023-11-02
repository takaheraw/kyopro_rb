package main

import "fmt"

func getBit(num, bit int) int {
	return (num >> bit) & 1
}

func getBitMask(num, bit int) int {
	return num ^ (1 << bit)
}

func get_next(pos, x, y, z, n int) int {
	state := make([]int, n)
	for i := 0; i < n; i++ {
		state[i] = getBit(pos, i)
	}
	for _, lamp := range []int{x, y, z} {
		state[lamp] ^= 1
	}
	result := 0
	for i, s := range state {
		if s == 1 {
			result |= (1 << i)
		}
	}
	return result
}

func main() {
	var n, m int
	fmt.Scan(&n, &m)

	a := make([]int, n)
	for i := 0; i < n; i++ {
		fmt.Scan(&a[i])
	}

	actions := make([][]int, m)
	for i := 0; i < m; i++ {
		actions[i] = make([]int, 3)
		for j := 0; j < 3; j++ {
			fmt.Scan(&actions[i][j])
			actions[i][j]--
		}
	}

	graph := make([][]int, 1<<uint(n))
	for i := 0; i < 1<<uint(n); i++ {
		for _, action := range actions {
			graph[i] = append(graph[i], get_next(i, action[0], action[1], action[2], n))
		}
	}

	start := 0
	for i, lamp := range a {
		if lamp == 1 {
			start |= (1 << i)
		}
	}

	goal := (1 << n) - 1

	dist := make([]int, 1<<uint(n))
	for i := 0; i < 1<<uint(n); i++ {
		dist[i] = -1
	}
	dist[start] = 0

	queue := []int{start}

	for len(queue) > 0 {
		pos := queue[0]
		queue = queue[1:]
		for _, next_pos := range graph[pos] {
			if dist[next_pos] == -1 {
				dist[next_pos] = dist[pos] + 1
				queue = append(queue, next_pos)
			}
		}
	}

	fmt.Println(dist[goal])
}
