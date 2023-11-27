program prime
use OMP_LIB

    implicit none
    integer :: i, j, n, count
    logical :: isprime
    integer, allocatable :: primes(:)
    integer :: upper_bound = 100000
    allocate(primes(upper_bound/2))
    count = 0
    !$omp parallel do private(isprime, i) shared(primes) reduction(+:count)
    do n = 2, upper_bound ! this is inclusive
        isprime = .true.
        do i = 2, n-1
            if (mod(n, i) == 0) then
                isprime = .false.
                exit
            end if
        end do
        if (isprime) then
            count = count + 1
            primes(count) = n
        end if
    end do
    !$omp end parallel do

    print *, "Total number of primes found:", count

end program prime
