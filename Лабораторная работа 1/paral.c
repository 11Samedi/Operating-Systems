#include<stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include"fibonacci.h"


#define MAXBUFSIZE 1024
const int STDIO = 1;


int n = 11;


int main(){
    char buf[MAXBUFSIZE];
    int p[2];
    pipe(p);
    ssize_t rc = fork();
    if (rc == 0) { // a child process
        long long int fibonaccii = fibonacci(n);
        ssize_t l = snprintf(buf, sizeof(buf), "Fibonacci number of %d is %lld\n", n, fibonaccii);
        close(p[0]);
        write(p[1], buf, MAXBUFSIZE);
        close(p[1]);
        _exit(0);
    } 
    else if (rc > 0) {
        int crc;
        close(p[1]);
        wait(&crc);
        ssize_t l = read(p[0], buf, MAXBUFSIZE);
        write(STDIO, buf, strlen(buf));
        close(p[0]);
    } 
    else {
        printf("Error creating a child process!\n");
    }
    return 0;
}