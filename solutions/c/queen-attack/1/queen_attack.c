#include "queen_attack.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

bool isInvalid(position_t queen_1, position_t queen_2) {
    return (
        (queen_1.row == queen_2.row &&
        queen_1.column == queen_2.column) ||
        queen_1.row > 7 ||
        queen_1.column > 7 ||
        queen_2.row > 7 ||
        queen_2.column > 7
    );
}
attack_status_t can_attack(position_t queen_1, position_t queen_2) {
    // see if any aren't on the board
    if (isInvalid(queen_1, queen_2)) {
        return INVALID_POSITION;
    }

    // see if on same rank or file
    if (queen_1.row == queen_2.row || queen_1.column == queen_2.column) {
        return CAN_ATTACK;
    }

    // see if on diagonal
    if ((queen_1.row + queen_2.column) == (queen_1.column + queen_2.row)) {
        return CAN_ATTACK;
    } else if ((queen_1.row + queen_1.column) == (queen_2.row + queen_2.column)) {
        return CAN_ATTACK;
    }
    return CAN_NOT_ATTACK;
}