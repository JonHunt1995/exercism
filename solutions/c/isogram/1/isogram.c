#include "isogram.h"
#include "string.h"
#include <ctype.h>
#include <stdio.h>


bool is_isogram(const char phrase[]) {
    if (phrase == NULL) {
        return false;
    }

    size_t len = strlen(phrase);
    char copy[len + 1];
    memset(copy, 0, sizeof(copy));
    printf("%s %s \n", copy, phrase);
    for (int i = 0; phrase[i] != '\0'; i++) {
        
        if (!isalpha(phrase[i])) {
            copy[i] = tolower(phrase[i]);
            continue;
        }
        if (strchr(copy, tolower(phrase[i])) != NULL) {
            return false;
        }
        copy[i] = tolower(phrase[i]);
    }
    printf("%s %s \n", copy, phrase);
    return true;
}