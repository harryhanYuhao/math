upper_bound = 100000
counter = 0
primes = []

for i in 2:upper_bound
	is_prime = true
	for j in 2:i-1
		if i % j == 0
			is_prime = false
			break
		end
	end
	if is_prime
		push!(primes, i)
		global counter += 1
	end
end 

println("$counter primes found under $upper_bound")
