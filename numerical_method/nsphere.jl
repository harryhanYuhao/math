# write a function to sum all elements in a list
# rand(10) creates a list of 10 uniformly distributed random numbers from 0 to 1
# julia is 1-indexed, so the first element is rand(10)[1]
# Julia vector initialization
# x = zeros(0)
# append!(x,[1,2])
using DelimitedFiles
using Printf
counter = 0
function sum_list(list)
	sum = 0
	for i in list
		sum += i
	end
	return sum
end


function sum_square(list)
	sum = 0
	for i in list
		sum += i*i
	end
	return sum
end

# This algorithm will not generate a uniform distribution, off by quite a bit
function random_n_array(n)
	res = rand(n);
	global counter;
	counter += 1;
	while (sum_square(res))>1 
		res = rand(n);
		counter+=1;
	end
	return res
end

function fn_area_n_sphere(n, iter)
	area_hypersphere=[3.1415926];
	approx = 0;
	for i in 1:n 
		output = zeros(0);
		for j in 1:iter
			buffer = random_n_array(i+1);
			append!(output, sqrt(1-sum_square(buffer)))
		end
		approx=area_hypersphere[i]*(sum_list(output)/iter)*2.0
		append!(area_hypersphere, approx)
	end 

	exp = [3.14159, 4.18879, 4.9348, 5.2637, 5.1677, 4.7247, 4.0587, 3.2985];
	@printf("%4s %12s %8s\n", "Di", "Calc", "error")
	for i in 1:n
		@printf("%4d %12.6f %8.3f%s\n", i+1, area_hypersphere[i], (area_hypersphere[i]-exp[i])/exp[i]*100, "%")
	end
	println("Iterations: ", iter)
	return 1;
end

fn_area_n_sphere(8,10000);
println("Counter: ", counter);
