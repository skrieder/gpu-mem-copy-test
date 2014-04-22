#include <stdio.h>

int main(int argc, char** argv) {

  // init vars
  int malloc_size_bytes, num_mallocs;

  // not enough args throw error
  if(argc < 2){
    printf("usage: %s <int malloc_size_bytes> <int number_mallocs>");
  }

  // take in a command line arg to set the loop count
  if(argc > 2){
    malloc_size_bytes = atoi(argv[1]);
    num_mallocs = atoi(argv[2]);
  }

  // delcare two variables
  int *dev_a;

  // get the size of an int for the cuda malloc
  int size = malloc_size_bytes;

  // loop over num_mallocs
  for(int i = 0; i < num_mallocs; i++){
    cudaMalloc((void **)&dev_a, size);
  }

  return 0;
}
