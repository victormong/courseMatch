
dict = "{\"Arun Kumar\":{\"Android Development for Beginners\":4.0, \"How to create <anything> in Android\":5.0, \"Developing Android Apps\":5.0, \"Android Wear Development\":4.0, \"How to Use Git and GitHub\":4.0, \"Intro to Computer Science\":5.0, \"Gradle for Android and Java\":4.0, \"Advanced Android App Development\":4.0}, \"Dileep Kosur\":{\"Android Development for Beginners\":4.0, \"Advanced Android App Development\":3.0, \"Developing Android Apps\":4.0}, \"Akshay\":{\"Android Development for Beginners\":2.0, \"How to create <anything> in Android\":3.0, \"Developing Android Apps\":5.0, \"Advanced Android App Development\":5.0, \"Android Auto Development\":4.0, \"Google Play Services: AdMob\":5.0, \"Intro to Relational Databases\":5.0}, \"Easwar\":{\"Linux Command Line Basics\":4.0, \"How to create <anything> in Android\":5.0, \"Android Development for Beginners\":5.0}}"

user ="Dileep Kosur"
#{}%x{python collaborative_filtering.py #{dict} #{user}}

system("python collaborative_filtering.py #{dict} #{user}")

#system('python collaborative_filtering.py "{\"Arun Kumar\":{\"Android Development for Beginners\":4.0, \"How to create <anything> in Android\":5.0, \"Developing Android Apps\":5.0, \"Android Wear Development\":4.0, \"How to Use Git and GitHub\":4.0, \"Intro to Computer Science\":5.0, \"Gradle for Android and Java\":4.0, \"Advanced Android App Development\":4.0}, \"Dileep Kosur\":{\"Android Development for Beginners\":4.0, \"Advanced Android App Development\":3.0, \"Developing Android Apps\":4.0}, \"Akshay\":{\"Android Development for Beginners\":2.0, \"How to create <anything> in Android\":3.0, \"Developing Android Apps\":5.0, \"Advanced Android App Development\":5.0, \"Android Auto Development\":4.0, \"Google Play Services: AdMob\":5.0, \"Intro to Relational Databases\":5.0}, \"Easwar\":{\"Linux Command Line Basics\":4.0, \"How to create <anything> in Android\":5.0, \"Android Development for Beginners\":5.0}}" "Akshay"')

=begin
a = {"Arun Kumar"=>{"Android Development for Beginners"=>4.0, "How to create <anything> in Android"=>5.0, "Developing Android Apps"=>5.0, "Android Wear Development"=>4.0, "How to Use Git and GitHub"=>4.0, "Intro to Computer Science"=>5.0, "Gradle for Android and Java"=>4.0, "Advanced Android App Development"=>4.0}, "Dileep Kosur"=>{"Android Development for Beginners"=>4.0, "Advanced Android App Development"=>3.0, "Developing Android Apps"=>4.0}, "Akshay"=>{"Android Development for Beginners"=>2.0, "How to create <anything> in Android"=>3.0, "Developing Android Apps"=>5.0, "Advanced Android App Development"=>5.0, "Android Auto Development"=>4.0, "Google Play Services: AdMob"=>5.0, "Intro to Relational Databases"=>5.0}, "Easwar"=>{"Linux Command Line Basics"=>4.0, "How to create <anything> in Android"=>5.0, "Android Development for Beginners"=>5.0}}
#This should work
b = a.to_s.gsub("=>",".")
`python collaborative_filtering.py b "Arun Kumar"`
=end
