static class AssemblyLine
{
    public static double SuccessRate(int speed) =>
       speed switch
       {
            0 => 0.0, 
            1 => 1.0,
            2 => 1.0,
            3 => 1.0,
            4 => 1.0,
            5 => 0.9,
            6 => 0.9,
            7 => 0.9,
            8 => 0.9,
            9 => 0.8,
            10 => 0.77, 
            _ => 0.0
       };
    
    public static double ProductionRatePerHour(int speed)
    {
        return SuccessRate(speed) * speed * 221;
    }

    public static int WorkingItemsPerMinute(int speed)
    {
        return (int)(ProductionRatePerHour(speed) / 60);
    }
}
