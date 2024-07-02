import java.util.*;

public class RevStr {
	public String reverseByWords(String sentence) {
		String[] words = sentence.split(" ");
		String revSentence = "";
		for (int i = words.length - 1; i >= 0; i--) {
			revSentence += words[i];
			if (i > 0) {
				revSentence += " ";
			}
		}
		return revSentence;
	}

	public static void main(String[] args) {
		String sentence = "Everything is reverse";
		RevStr revStr = new RevStr();// creating an instance of the class RevStr in order to make static reference to
										// method reverseByWords(String) from the type RevStr.
		String out = revStr.reverseByWords(sentence); // calling the method on this instance
		System.out.println(out);
	}

}