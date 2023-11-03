package main

import (
	"fmt"
	"sort"
)

type Pair struct {
	Count int
	Index int
}

type ByCountIndexDesc []Pair

func (a ByCountIndexDesc) Len() int      { return len(a) }
func (a ByCountIndexDesc) Swap(i, j int) { a[i], a[j] = a[j], a[i] }
func (a ByCountIndexDesc) Less(i, j int) bool {
	if a[i].Count != a[j].Count {
		return a[i].Count > a[j].Count
	}
	return a[i].Index < a[j].Index
}

func paintColumn(h, w int, gridCopy [][]byte, remaining int) int {
	columns := make([]Pair, w)
	for j := 0; j < w; j++ {
		cnt := 0
		for i := 0; i < h; i++ {
			if gridCopy[i][j] == '.' {
				cnt++
			}
		}
		columns[j] = Pair{Count: cnt, Index: j}
	}

	sort.Sort(ByCountIndexDesc(columns))

	for j := 0; j < remaining; j++ {
		idx := columns[j].Index
		for i := 0; i < h; i++ {
			gridCopy[i][idx] = '#'
		}
	}

	count := 0
	for i := 0; i < h; i++ {
		for j := 0; j < w; j++ {
			if gridCopy[i][j] == '#' {
				count++
			}
		}
	}

	return count
}

func main() {
	var h, w, k int
	fmt.Scanf("%d %d %d", &h, &w, &k)

	grid := make([][]byte, h)
	for i := 0; i < h; i++ {
		var row string
		fmt.Scanf("%s", &row)
		grid[i] = []byte(row)
	}

	answer := 0

	for mask := 0; mask < (1 << uint(h)); mask++ {
		gridCopy := make([][]byte, h)
		for i := 0; i < h; i++ {
			gridCopy[i] = make([]byte, w)
			copy(gridCopy[i], grid[i])
		}

		remaining := k
		for i := 0; i < h; i++ {
			if (mask & (1 << uint(i))) != 0 {
				remaining--
				for j := 0; j < w; j++ {
					gridCopy[i][j] = '#'
				}
			}
		}

		if remaining >= 0 {
			count := paintColumn(h, w, gridCopy, remaining)
			if count > answer {
				answer = count
			}
		}
	}

	fmt.Println(answer)
}
