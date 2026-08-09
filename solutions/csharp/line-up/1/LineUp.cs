public static class LineUp
{
    public static string Ordinal(this int number) => number switch {
            _ when number % 10 == 1 && number % 100 != 11 => $"{number}st",
            _ when number % 10 == 2 && number % 100 != 12 => $"{number}nd",
            _ when number % 10 == 3 && number% 100 != 13 => $"{number}rd",
            _ => $"{number}th",
    };
    public static string Format(string name, int number)
    {
        return $"{name}, you are the {number.Ordinal()} customer we serve today. Thank you!";
    }
}
