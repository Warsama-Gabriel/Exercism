# Sieve

Use the Sieve of Eratosthenes to find all the primes from 2 up to a given
number.

The Sieve of Eratosthenes is a simple, ancient algorithm for finding all
prime numbers up to any given limit. It does so by iteratively marking as
composite (i.e. not prime) the multiples of each prime, starting with the
multiples of 2. It does not use any division or remainder operation.

Create your range, starting at two and continuing up to and including the given limit. (i.e. [2, limit])

The algorithm consists of repeating the following over and over:

- take the next available unmarked number in your list (it is prime)
- mark all the multiples of that number (they are not prime)

Repeat until you have processed each number in your range.

When the algorithm terminates, all the numbers in the list that have not
been marked are prime.

limit 22
prime -> 2
marked numbers (not prime) -> 4, 6, 8, 10, 12, 14, 16, 18, 20
prime (next unmarked number) -> 3
marked numbres (not prime) -> 6, 9, 12, 15, 18, 21
prime -> 5
not prime -> 10, 15, 20
prime -> 7
not prime -> 14, 21
prime -> 11
not prime -> 22
prime -> 13
not prime ->
prime -> 17
not prime ->
prime -> 19
not prime ->

return [2, 3, 5, 7, 11, 13, 17, 19]

# from 2 check if that is inside the array of marked numbers
# if not put that number in primes array otherwise continue on to next step
#from 2 to all its multiples up to a limit put those in an array called marked numbers
# go to next number after 2 -> (3) check if that is inside the array of marked numbers
# if not put that number in primes array otherwise continue on to next step
# from 3 to all its multiples up to a limit put those in an array called marked numbers
# go to next number after 3 -> (4) check if that is inside the array of marked numbers
# if not put that number in primes array otherwise continue on to next step
# from 4 to all its multiples up to a limit put those in an array called marked numbers
# go to next number after 4 -> (5) check if that is inside the array of marked numbers
# if not put that number in primes array otherwise continue on to next step.

The wikipedia article has a useful graphic that explains the algorithm:
https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

Notice that this is a very specific algorithm, and the tests don't check
that you've implemented the algorithm, only that you've come up with the
correct list of primes. A good first test is to check that you do not use
division or remainder operations (div, /, mod or % depending on the
language).

* * * *

For installation and learning resources, refer to the
[Ruby resources page](http://exercism.io/languages/ruby/resources).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

Run the tests from the exercise directory using the following command:

    ruby sieve_test.rb

To include color from the command line:

    ruby -r minitest/pride sieve_test.rb


## Source

Sieve of Eratosthenes at Wikipedia [http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes](http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
