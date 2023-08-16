package api.Utility;

import java.util.HashSet;
import java.util.Random;
import java.util.Set;

public class GenerateDate {
	

		        
		
	public static String getEmail() {
		String prefix = "VenomEmail";
		String provider = "@gmail.com";

// This part int random =  (int) is type casted 
// so we can have the numbers as integer not double 

		int random = (int) (Math.random() * 10000);
//		double random =  (Math.random() * 10000);
		String email = prefix + random + provider;
		return email;

	}

// More sophisticated EmailGenerator
	public static class EmailGenerator {

		public Set<String> generatedEmails = new HashSet<>();
		public static String PREFIX = "Auto_email";
		public static String PROVIDER = "@tekschool.us";

		public String getEmail() {
			int random = (int) (Math.random() * 10000);
			String email = PREFIX + random + PROVIDER;

			while (generatedEmails.contains(email)) {
				random = (int) (Math.random() * 10000);
				email = PREFIX + random + PROVIDER;
			}

			generatedEmails.add(email);
			return email;
		}

	}

	
	public static void main(String[] args) {
//		for (int i = 0; i < 10; i++) {
//			String email = getEmail();
//			System.out.println(email);
//		}
		GenerateDate data = new GenerateDate();
//		System.out.println(GenerateDate.getEmail());

//		System.out.println(GenerateDate.getPhoneNumber());
		System.out.println(GenerateDate.getAdressLine());
	
		
		
		
	}

	
	
	public static Set<String> gNum = new HashSet<>();

	public static String getPhoneNumber() {

		String phoneNumber = "202";

		for (int i = 0; i < 7; i++) {
			phoneNumber += (int) (Math.random() * 10);
			if (!gNum.contains(phoneNumber)) {
				gNum.add(phoneNumber);
//	                break;
			}
		}
		return phoneNumber;
	}
	public static Set<String> gAdd = new HashSet<>();

	public static String getAdressLine() {

		String phoneNumber = "202";

		for (int i = 0; i < 7; i++) {
			phoneNumber += (int) (Math.random() * 10);
			if (!gAdd.contains(phoneNumber)) {
				gAdd.add(phoneNumber);

			}
		}
		return phoneNumber;
	
}
	
	}
