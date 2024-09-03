public class StringListTest {
    public static List<String> generateStringList(Integer len) {
        List<String> listOfStrings = new List<String>();
        for(Integer i=0; i<len; i++) {
            String str = 'Test ' + i;
            listOfStrings.add(str);
        }
        return listOfStrings;
    }
}