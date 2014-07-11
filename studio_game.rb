def say_hello(name, health=100)
	"I'm #{name.capitalize} with a health of #{health} as of #{time}."
end

def time
	t = Time.new
	t.strftime("%T")
end

puts say_hello('moe')