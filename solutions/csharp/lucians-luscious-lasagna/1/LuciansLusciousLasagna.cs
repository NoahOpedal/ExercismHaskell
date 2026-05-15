class Lasagna
{
    public int ExpectedMinutesInOven()
    {
        return 40;
    }

    public int RemainingMinutesInOven(int timeSpentInOven)
    {
        return ExpectedMinutesInOven() - timeSpentInOven;
    }

    public int PreparationTimeInMinutes(int layers)
    {
        return 2 * layers;
    }

    public int ElapsedTimeInMinutes(int layers, int timeSpentInOven)
    {
        return PreparationTimeInMinutes(layers) + timeSpentInOven;
    }
}
