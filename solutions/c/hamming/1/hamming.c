#include "hamming.h"
#include <string.h>

int compute(const char *lhs, const char *rhs) {
    size_t len = strlen(lhs);
    if (len != strlen(rhs)) {
        return -1;
    }
    int hamming_distance = 0;
    
    for (size_t i = 0; i < len; i++) {
        if (lhs[i] != rhs[i]) {
            hamming_distance++;
        }
    }

    return hamming_distance;
}