#include <stdio.h>
#include <sys/time.h>


int main(int argc, char** argv) {

  printf("Star timer\n");
  // Start the timer
  struct timeval tim;
  gettimeofday(&tim, NULL);
  double t1=tim.tv_sec+(tim.tv_usec/1000000.0);

  // init vars
  int malloc_size_bytes, num_mallocs;

  // not enough args throw error
  if(argc < 2){
    printf("usage: %s <int malloc_size_bytes> <int number_mallocs>\n");
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
    cudaFree(dev_a);
  }

  // Print timing information
  gettimeofday(&tim, NULL);
  double t2=tim.tv_sec+(tim.tv_usec/1000000.0);
  printf("%.6lf\t", (t2-t1)); // 1000000000 = 10^9, 1000000 = 10^6
  printf("END TIMER!\n");

  return 0;
}
