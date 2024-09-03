@isTest
public class ParkLocatorTest {
    @isTest public static void calloutTest() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country = 'United States';
        List<String> expected = new List<String>{'Yosemite', 'Sequoia', 'Crater Lake'};
        List<String> actual = ParkLocator.country(country);
        System.assertEquals(expected, actual);
    }
}