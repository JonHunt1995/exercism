def sum_of_multiples(limit, multiples):
    return sum(num for num in range(limit) if any(num % multiple == 0 for multiple in multiples if multiple != 0))
