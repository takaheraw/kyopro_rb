package main

import (
	"fmt"
	"math"
)

type Point2D struct {
	x, y int
}

func main() {
	var N int
	fmt.Scan(&N)
	points := make([]Point2D, N+1)
	for i := 1; i <= N; i++ {
		fmt.Scan(&points[i].x, &points[i].y)
	}

	answer := playGreedy(N, points)

	for i := 1; i <= N+1; i++ {
		fmt.Println(answer[i])
	}
}

func playGreedy(N int, points []Point2D) []int {
	currentPlace := 1
	P := make([]int, N+2)
	visited := make([]bool, N+1)
	P[1] = 1
	visited[1] = true

	for i := 2; i <= N; i++ {
		minDist := 1.0e+99
		minID := -1
		for j := 1; j <= N; j++ {
			if visited[j] {
				continue
			}
			newDist := points[currentPlace].dist(points[j])
			if minDist > newDist {
				minDist = newDist
				minID = j
			}
		}

		visited[minID] = true
		P[i] = minID
		currentPlace = minID
	}

	P[N+1] = 1

	return P
}

func (p Point2D) dist(q Point2D) float64 {
	return math.Sqrt(float64((p.x-q.x)*(p.x-q.x) + (p.y-q.y)*(p.y-q.y)))
}
