package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Scan()
	nm := strings.Split(scanner.Text(), " ")
	N, _ := strconv.Atoi(nm[0])
	M, _ := strconv.Atoi(nm[1])

	A := make([]int, M+1)
	B := make([]int, M+1)
	for i := 1; i <= M; i++ {
		scanner.Scan()
		ab := strings.Split(scanner.Text(), " ")
		A[i], _ = strconv.Atoi(ab[0])
		B[i], _ = strconv.Atoi(ab[1])
	}

	G := make([][]int, N+1)
	for i := 1; i <= N; i++ {
		G[i] = make([]int, 0)
	}
	for i := 1; i <= M; i++ {
		G[A[i]] = append(G[A[i]], B[i])
		G[B[i]] = append(G[B[i]], A[i])
	}

	for i := 1; i <= N; i++ {
		fmt.Print(i, ": {")
		for j, v := range G[i] {
			if j != 0 {
				fmt.Print(", ")
			}
			fmt.Print(v)
		}
		fmt.Println("}")
	}
}
