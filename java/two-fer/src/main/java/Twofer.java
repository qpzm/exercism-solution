public class Twofer {
    public String twofer(String name) {
        if(name == null) {
            name = "you";
        }
        String str = new StringBuilder()
            .append("One for ")
            .append(name)
            .append(", one for me.")
            .toString();
        return str;
    }
}
