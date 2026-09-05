static class SavingsAccount
{
    public static float InterestRate(decimal balance) => balance switch {
        < 0 => 3.213f,
        < 1000 => 0.5f,
        < 5000 => 1.621f,
        _ => 2.475f
    };
    

    public static decimal Interest(decimal balance) => (balance * (decimal)InterestRate(balance)) / 100m;

    public static decimal AnnualBalanceUpdate(decimal balance) => balance + Interest(balance);

    public static int YearsBeforeDesiredBalance(decimal balance, decimal target) => (balance >= target) switch {
            true => 0,
            false => 1 + YearsBeforeDesiredBalance(AnnualBalanceUpdate(balance), target)
    };
}
