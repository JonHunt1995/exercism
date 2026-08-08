static class AssemblyLine
{
    public static double SuccessRate(int speed)
    {
        switch (speed) 
        {
            case < 1:
                return 0.0;
            case <= 4:
                return 1.0;
            case <= 8:
                return 0.9;
            case <= 9:
                return 0.8;
            default:
                return 0.77;
        }
    }
    
    public static double ProductionRatePerHour(int speed) => speed * SuccessRate(speed) * 221;


    public static int WorkingItemsPerMinute(int speed) => (int)ProductionRatePerHour(speed) / 60;
}
