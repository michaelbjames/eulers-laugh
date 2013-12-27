// It can be seen that the number, 125874, and its double, 251748,
// contain exactly the same digits, but in a different order.

// Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x,
// and 6x, contain the same digits.

package main

import "strconv"
import "fmt"

func main() {
  for i := 1; true; i++ {
    if permutation(i,2*i) &&
       permutation(i,3*i) &&
       permutation(i,4*i) &&
       permutation(i,5*i) &&
       permutation(i,6*i) {
        fmt.Println(i)
        break
    }
  }
}

func permutation(x int, test int) (isPerm bool) {
  sigma1 := strconv.Itoa(test)
  sigma2 := strconv.Itoa(x)
  digits := make(map[uint8]int)
  for i := 0; i < len(sigma1); i++ {
    digits[sigma1[i]]++
  }
  for i := 0; i < len(sigma2); i++ {
    digits[sigma2[i]]--
  }
  for k,_ := range digits {
    if digits[k] != 0 {
      return false
    }
  }
  return true
}