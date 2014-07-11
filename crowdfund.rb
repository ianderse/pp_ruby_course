def print_project(name, funding)
	"Project #{name} has $#{funding} dollars available as of #{time}"
end

def time
	t = Time.new
	t.strftime("%T")
end