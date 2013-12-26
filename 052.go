// It can be seen that the number, 125874, and its double, 251748,
// contain exactly the same digits, but in a different order.

// Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x,
// and 6x, contain the same digits.

package main

import "strconv"
import "fmt"

func main() {
  
}

func permutation(x int, test string) (isPerm bool) {
  sigma := strconv.Itoa(x)
  var digits [10]int
  for i := 0; i < len(test); i++ {
    tmp := test[i]
    fmt.Println(tmp)
    digits[tmp]++
  }
  for i := 0; i < len(sigma); i++ {
    digits[strconv.Atoi(sigma[i])]--
  }
  for i := 0; i < len(digits); i++ {
    if digits[i] != 0 {
      return false
    }
  }
  return true
}