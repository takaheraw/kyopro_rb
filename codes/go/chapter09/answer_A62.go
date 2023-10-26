package main

import "fmt"

// 深さ優先探索を行う関数（pos は現在位置、visited[x] は頂点 x が青色かどうかを表す真偽値）
func dfs(pos int, g [][]int, visited []bool) {
	visited[pos] = true
	for _, i := range g[pos] {
		if !visited[i] {
			dfs(i, g, visited)
		}
	}
}

func main() {
	var n, m int
	fmt.Scanf("%d %d", &n, &m)

	// 隣接リストの作成
	g := make([][]int, n+1)
	for i := 0; i < m; i++ {
		var a, b int
		fmt.Scanf("%d %d", &a, &b)
		g[a] = append(g[a], b)
		g[b] = append(g[b], a)
	}

	// 深さ優先探索
	visited := make([]bool, n+1)
	dfs(1, g, visited)

	// 連結かどうかの判定（answer = true のとき連結）
	answer := true
	for _, v := range visited[1:] {
		if !v {
			answer = false
			break
		}
	}

	// 答えの出力
	if answer {
		fmt.Println("The graph is connected.")
	} else {
		fmt.Println("The graph is not connected.")
	}
}
