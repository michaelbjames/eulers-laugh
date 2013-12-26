// It can be seen that the number, 125874, and its double, 251748,
// contain exactly the same digits, but in a different order.

// Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x,
// and 6x, contain the same digits.

package main

import "strconv"
import "fmt"

func main() {
  fmt.Println(permutation(125874,"251748"))
}

func permutation(x int, test string) (isPerm bool) {
  sigma := strconv.Itoa(x)
  digits := make(map[uint8]int)
  for i := 0; i < len(test); i++ {
    digits[test[i]]++
  }
  for i := 0; i < len(sigma); i++ {
    digits[sigma[i]]--
  }
  for k,_ := range digits {
    if digits[k] != 0 {
      return false
    }
  }
  return true
}