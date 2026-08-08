public static class LogAnalysis 
{
    public static  string SubstringAfter(this string log, string delim) {
        return log.Split(delim)[1];
    }

    public static  string SubstringBetween(this string log, string start, string end) {
        var startingIndex = log.IndexOf(start) + start.Length;
        var subStringLength = log.IndexOf(end) - startingIndex;
        return log.Substring(startingIndex, subStringLength);
    }

    public static  string Message(this string log) {
        return log.SubstringAfter(":").Trim();
    }
   
    public static  string LogLevel(this string log) {
        return log.SubstringBetween("[", "]");
    }
}