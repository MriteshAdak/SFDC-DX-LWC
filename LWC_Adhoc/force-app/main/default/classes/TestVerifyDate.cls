@isTest
public class TestVerifyDate {
    private static Date referenceDate = Date.newInstance(2024, 8, 16);
    private static Date dateWithin30Days = Date.newInstance(2024, 8, 26);
    private static Date dateOver30Days = Date.newInstance(2024, 11, 26);
    private static Date lastDayOfReferenceMonth = Date.newInstance(2024, 8, 31);
    
    @isTest private static void testWithin30Days() {
        Date checkResult = VerifyDate.CheckDates(referenceDate, dateWithin30Days);
        System.assertEquals(checkResult, dateWithin30Days);
    }
    @isTest private static void testOver30Days() {
        Date checkResult = VerifyDate.CheckDates(referenceDate, dateOver30Days);
        System.assertEquals(checkResult, lastDayOfReferenceMonth);
    }
    @isTest private static void greaterReferenceDate() {
        Date checkResult = VerifyDate.CheckDates(dateWithin30Days, referenceDate);
        System.assertEquals(checkResult, lastDayOfReferenceMonth);
    }
}