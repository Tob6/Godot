extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var score = ScoreNode.score;

	var suffix = "";
	var magnitude = determine_magnitude(score);
	
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
	
	#cut off to 3rd digit after comma
	if magnitude > 1:
		score = floor(score/1000**(magnitude-1))*1000**(magnitude-1);

	if magnitude > 0:
		set_text(str(score/(1000**magnitude)) + "%s" % suffix + " 🍎");
	else:
		set_text(str(floor(score)) + " 🍎");

func determine_magnitude(number):
#determine a number's power of 1000
#das geht bestimmt auch mit Logarithmen
	var magnitude = 0;
	while(number >= 1000):
		number/=1000;
		magnitude += 1;
	return magnitude;
