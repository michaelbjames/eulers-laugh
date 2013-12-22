int fib(int* mem, int n){
  int temp = mem[n];
  if(temp > 0)
    return temp;
  if(n < 2)
    temp = 1;
  else 
    temp = fib(n-1) + fib(n-2);
  return mem[n] = temp;
}

int main(int argc, char const *argv[])
{
  // Impossible to need this many integers.
  int mem_table[1000];
  return 0;
}