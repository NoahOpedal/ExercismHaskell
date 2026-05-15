static class LogLine
{
    public static string Message(string logLine)
    {
        return logLine.Split("]:")[1].Trim();
    }

    public static string LogLevel(string logLine)
    {
        return logLine.Substring(1).Split("]")[0].ToLower();
    }

    public static string Reformat(string logLine)
    {
        string message = Message(logLine);
        string level = LogLevel(logLine);
        
        return $"{message} ({level})";
    }
}
