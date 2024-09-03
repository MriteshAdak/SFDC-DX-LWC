@isTest
public class AnimalLocatorTest {
    @isTest static void testAnimalId() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String result = AnimalLocator.getAnimalNameById(1);
        System.assertEquals('chicken', result);
    }
}