def insert_name(name, arr)
	array = arr.map do |x|
		if name.is_a?(String)
			x.sub("XXX", name)
		else
			x.sub("XXX", name.to_s)
		end
	end
	array
end

def say(arr)
	#puts "\n" , arr
	narr = arr.join("\n")
	narr = narr.split("")
	narr.each do |x|
		print x
		sleep(0.05)
	end
end

def clear_screen
	system "clear"
end

def display_options(arr)
	x = arr.length
	puts ""
	x.times do |i|
		puts "* #{arr[i]}"
	end
	puts ""
end

def prompt_answer
	say(["Which one is it?\n"])
	print ">> "
end

def sound_win
	puts "\a"*5
end

def sound_lose
	puts "\a"*2
end

def create_score(options_array, name, message_array)

	winning_array = ["Congratulations XXX!!", "You guessed it right."]
	losing_array = ["Wrong!", "I was thinking about XXX."]

	computer_choice = options_array.sample

	say(insert_name(name, message_array))
	display_options(options_array)
	prompt_answer

	answer = gets.chomp.downcase.split(" ").map do |x|
		x.capitalize
	end.join(" ")

	if answer == computer_choice
		sound_win
		say(insert_name(name, winning_array))
		wait_to_continue
		clear_screen
		1
	else
		sound_lose
		say(insert_name(computer_choice, losing_array))
		wait_to_continue
		clear_screen
		0
	end
end

def wait_to_continue
	puts "\nPress Enter Once You Are Ready to Continue."
	wait = gets
end

# => Question 1
people = ["Alan Turing", "Grace Hopper", "Ada Lovelace"]
people_question = ["Ok XXX, Let's start.", "I am thinking about one of these people:", "(capitalization not a factor you coder you...)"]

# => Question 2
loops = ["For", "While", "Each"]
loops_question = ["Ok XXX, let's try this.","I am thinking about one of these loops:"]

# => Question 3
classes = ["String", "Fixnum", "Array"]
classes_question = ["How about classes?", "You think you can guess that XXX?"]

# => Question 4
educators = ["Ed", "Joe", "Jose"]
educators_question = ["I am thinking about one of our educators now.", "(No XXX, it's not wierd at all...)"]

# => Question 5
directors = ["Bianca", "Gabe", "Matt"]
directors_question = ["Let's keep thinking about people.", "Who of these campus directors am I thinking about XXX?"]

# => Question 6
dogs = ["Trigger", "Moon"]
dogs_question = ["I'll make it a little easier for you XXX", "50/50 chance here.", "Which one of these LAB dogs am I thinking about?"]
# => Question 7
os = ["Windows", "Mac", "Linux"]
os_question = ["Ok enough people. I am a computer damnit.", "Which of these am I thinking about?"]

# => Question 8
languages = ["Ruby", "Javascript", "Python"]
languages_question = ["Which language do you think I prefer XXX?"]

# => Question 9
sites = ["Codeacademy", "Code School", "Treehouse"]
sites_question = ["How about online learning?", "I have one in mind. Which one?"]

# => Question 10
phones = ["Apple", "Android"]
phones_question = ["Ok XXX. Last question.","I'll make it easy again. 50/50 chance.","Which phone?"]

array1 = [people, loops, classes, educators, directors, dogs, os, languages, sites, phones]
array2 = [people_question, loops_question, classes_question, educators_question, directors_question, dogs_question, os_question, languages_question, sites_question, phones_question]

intro_text = ["Hello there Human!", "Before we start I would love to get your name."]
money_text = ["Thank you XXX!", "Please Insert Tokens...", "(If you don't have tokens please see Rogerio to purchase them!)"]
rules_text = ["Awesome, you chose to answer XXX questions.", "In each question, I will give you a list of 3 things of which 1 of them", "will be on my mind... or should I say on my hardrive?", "Your job is to guess which one it is.", "Are you ready? (Press Enter)"]
closing_win = ["Wow XXX!! You got everying right!", "I am starting to think you are a Turing complete machine yourself.", "Thanks for playing! Goodbye.\n"]
closing_lose = ["Keep trying XXX.", "Maybe one day you will become a Turing complete machine.", "Goodbye!\n"]


# =============================================================================================================================

# Intro 
say(intro_text)
puts "\nPlease Enter your Name:\n"
print ">> "

player_name = gets.chomp.capitalize
clear_screen

# Money
say(insert_name(player_name, money_text))

# wait
wait_to_continue

clear_screen

say(["Here is how it works..."])
stay_here = true
while stay_here
	puts "\nChoose a number between 2 and 10.\n"
	print ">> "

	num_questions = gets.chomp.to_i 
	if (2..10).include?(num_questions)
		stay_here = false
	end
	clear_screen
end
clear_screen

say(insert_name(num_questions, rules_text))
wait = gets
clear_screen
score = 0
question_count = 0

i = 0
while i < num_questions
	score += create_score(array1[i], player_name, array2[i])
	question_count += 1
	i += 1
end

puts "Your Final Score: #{score} out of #{num_questions}"
if score == num_questions
	say(insert_name(player_name, closing_win))
else
	say(insert_name(player_name, closing_lose))
end
