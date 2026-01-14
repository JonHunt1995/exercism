package sieve

func Sieve(limit int) []int {
    // Initialize Data Structures
    primes := []int{}
	primeChecker := make(map[int]bool, limit - 1)
    for i := 2; i <= limit; i++ {
        primeChecker[i] = true
    }
    // Loop through numbers and cross off their multiples
	for i := 2; i < limit; i++ {
        if primeChecker[i] {
            for j := i + i; j <= limit; j += i {
                primeChecker[j] = false
            }
       }
    }
    // Place remaining unmarked numbers into primes slice
	for i := 2; i <= limit; i++ {
        if primeChecker[i] {
            primes = append(primes, i)
        }
    }
    return primes
    
}
