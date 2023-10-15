package main

import "fmt"

func main() {
	var N int
	var S string
	fmt.Scan(&N, &S)

	// 答えを求める
	Answer := false
	for i := 0; i <= N-3; i++ {
		if S[i] == 'R' && S[i+1] == 'R' && S[i+2] == 'R' {
			Answer = true
		}
		if S[i] == 'B' && S[i+1] == 'B' && S[i+2] == 'B' {
			Answer = true
		}
	}

	// 出力
	if Answer == true {
		fmt.Println("Yes")
	} else {
		fmt.Println("No")
	}
}
