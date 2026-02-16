#include <fcgi_stdio.h>
#include <stdlib.h>

int main(void) {
    while (FCGI_Accept() >= 0) {
        printf("Content-Type: text/html\n\r\n");
        printf("<!DOCTYPE html>");
        printf("<html><head><title><Hello></title></head>");
        printf("<body><h1>Hello, World!</h1></body></html>");
    }
    return 0;
}