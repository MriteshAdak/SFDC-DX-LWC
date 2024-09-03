public class ParkLocator {
    public static List<String> country( String country) {
        ParkService.ParksImplPort pks = new ParkService.ParksImplPort();
        return pks.byCountry(country);
    }
}