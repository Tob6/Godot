extends Node

func number_with_suffix(number,pos_after_comma = 2):
	
	var suffix = "";
	var magnitude = determine_magnitude(number);
	
	#we'll use the short scale bc of 'merica 🇺🇸
	match magnitude:
		1:
			suffix = "k"
		2:
			suffix = "Mill"
		3:
			suffix = "Bill"
		4:
			suffix = "Trill"
		5:
			suffix = "Gazillions!! 🥵"
	
	#"Shift" number to position by magnitude
	number = number/(1000**(magnitude));
	return (str(round_place_after_comma(number,pos_after_comma)) + str(suffix));

func round_place_after_comma(number,pos):
	#pos is to which place after comma numbers is to be rounded
	return floor(number*10**pos)/10**pos

func determine_magnitude(number):
#determine a number's power of 1000
#das geht bestimmt auch mit Logarithmen
	var magnitude = 0;
	while(number >= 1000):
		number/=1000;
		magnitude += 1;
	return magnitude;
