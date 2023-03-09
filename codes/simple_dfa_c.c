#include <stdio.h>

#define SUCCESSFUL 0
#define ERROR -1

int scanner() {
    char c;
    while (1) {
        c = getchar();
        switch (c) {
            case 'a': 
                goto state2;
            case 'b': 
                goto state3;
            default: 
                // Call the error function or handle the error
                return ERROR; // For example, returning -1 for error
        }
    }
    
    state2: 
    while (1) {
        c = getchar();
        switch (c) {
            case 'a': 
                goto state2;
            case 'b': 
                goto state3;
            default: 
                // Call the error function or handle the error
                return ERROR; // For example, returning -1 for error
        }
    }
    
    state3: 
    while (1) {
        c = getchar();
        switch (c) {
            case 'a': 
                goto state2;
            case 'b': 
                goto state3;
            default: 
                // Return a success value
                return SUCCESSFUL;
        }
    }
}

int main() {
    int result = scanner();
    if (result == SUCCESSFUL) {
        printf("Accepted\n");
    } else {
        printf("Rejected\n");
    }
    return 0;
}
