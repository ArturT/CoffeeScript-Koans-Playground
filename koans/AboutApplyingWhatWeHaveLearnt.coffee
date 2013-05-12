describe 'About Applying What We Have Learnt', ->
  operations = [
    { direction: 'RT', distance: 200}
    { direction: 'FWD', distance: 50}
    { direction: 'RT', distance: 100}
    { direction: 'RT', distance: 20}
    { direction: 'FWD', distance: 200}
    { direction: 'RT', distance: 10}
  ]

  it 'should find a needle in a haystack (imperative)', ->
    findNeedle = (ops) ->
      hasInvalidOperation = false
      for i in [0..ops.length-1]
        if (ops[i].direction == 'FWD' && ops[i].distance > 100)
          hasInvalidOperation = true
          break
      return hasInvalidOperation

    expect(findNeedle(operations)).toBe(true)


  it 'should find needle in a haystack (functional)', ->
    # FILL_ME_IN solution goes in here
    # HINT: one way of doing this would be a 'for in when' construct using sum and
    # filter functions, the existential operator is also useful

    # example 1. filter and existential operator
    findNeedle = (ops) ->
      condition = (op) -> op.direction == 'FWD' && op.distance > 100
      needleKeys = ops.filter condition
      needleKeys?

    (expect findNeedle(operations)).toBe(true)


    # example 2. recursion
    findNeedle = (ops) ->
      if ops?
        if ops[0].direction == 'FWD' && ops[0].distance > 100
          true
        else
          findNeedle(ops[1..-1])
      else
        false

    (expect findNeedle(operations)).toBe(true)


  it 'should add all the natural numbers below 1000 that are multiples of 3 or 5 (imperative)', ->
    total = 0
    for i in [1..1000]
      if (i % 3 == 0 || i % 5 == 0)
        total += i
    expect(total).toBe(234168)


  it 'should add all the natural numbers below 1000 that are multiples of 3 or 5 (functional)', ->
    # FILL_ME_IN solution goes in here
    # HINT: one way of doing this would be a 'for in when' construct using sum and
    # filter functions

    # example 1. filter
    sum_multiples_of_3_or_5 = (number) ->
      condition = (n) -> n % 3 == 0 || n % 5 == 0
      validNumbers = [0..number].filter condition
      validNumbers.reduce (x, y) -> x + y

    (expect sum_multiples_of_3_or_5(1000)).toBe(234168)


    # example 2. recursion
    sum_multiples_of_3_or_5 = (number) ->
      condition = (n) -> n % 3 == 0 || n % 5 == 0
      if number > 0
        if condition(number)
          number + sum_multiples_of_3_or_5(number-1)
        else
          sum_multiples_of_3_or_5(number-1)
      else
        0

    (expect sum_multiples_of_3_or_5(1000)).toBe(234168)


  it 'should find the sum of all the even valued terms in the fibonacci sequence which do not exceed four million (imperative)', ->
    sum = 0
    fib = [0, 1, 1]
    i = 3
    currentFib = 0

    # Note, the condition in the while loop isn't strictly necessary, as the first fib
    # >4m is actually odd, but it is good practice for avoiding fencepost errors
    while (currentFib = fib[i] = fib[i-1] + fib[i-2]) < 4000000
      if (currentFib % 2 == 0)
        sum += currentFib
      i+=1

    expect(sum).toBe(4613732)


  it 'should find the sum of all the even valued terms in the fibonacci sequence which do not exceed four million (functional)', ->
    # FILL_ME_IN solution goes in here
    # HINT: one way of doing this would be to construct an array of Fibonacci numbers
    # using a function and a while loop, and then to filter it using an even function

    # example 1. fibonacci recursion function, even function, while loop, reduce
    fibonacci = (n) ->
      if n == 1 || n == 2
        1
      else
        fibonacci(n - 1) + fibonacci(n - 2)

    even = (n) -> n % 2 == 0

    fibonacci_even_numbers_which_do_not_exceed = (limit_number) ->
      fibArray = []
      i = 1
      while limit_number >= fibNumber = fibonacci(i)
        fibArray.push(fibNumber)
        i += 1
      fibEvenNumbers = fibArray.filter even
      fibEvenNumbers.reduce (x, y) -> x + y

    expect(fibonacci_even_numbers_which_do_not_exceed(4000000)).toBe(4613732)


# UNCOMMENT FOR EXTRA CREDIT
  is_prime = (n) ->
    if n == 2
      true
    else if n < 2
      false
    else
      isPrime = true
      for i in [2..n-1]
        if n % i == 0
          isPrime = false
          break
      isPrime


  it 'should check if number is prime', ->
    expect(is_prime(-1)).toBe(false)
    expect(is_prime(0)).toBe(false)
    expect(is_prime(1)).toBe(false)
    expect(is_prime(2)).toBe(true)
    expect(is_prime(3)).toBe(true)
    expect(is_prime(4)).toBe(false)
    expect(is_prime(10)).toBe(false)
    expect(is_prime(17)).toBe(true)


  it 'should find the largest prime factor of a composite number', ->
    largest_prime_factor_of = (composite_number) ->
      largest_prime_factor = null
      n = 2
      while n < composite_number
        largest_prime_factor = n if is_prime(n) && composite_number % n == 0
        n += 1
      largest_prime_factor

    expect(largest_prime_factor_of(1)).toBe(null)
    expect(largest_prime_factor_of(2)).toBe(null)
    expect(largest_prime_factor_of(14)).toBe(7)
    expect(largest_prime_factor_of(46)).toBe(23)
    expect(largest_prime_factor_of(3*23*7)).toBe(23)


  #it 'should find the largest palindrome made from the product of two 3 digit numbers', ->


  #it 'should what is the smallest number divisible by each of the numbers 1 to 20', ->


  #it 'should what is the difference between the sum of the squares and the square of the sums', ->


  it 'should find the 10001st prime', ->
    find_prime_at = (order) ->
      sum = 0
      n = 0
      while sum < order
        n += 1
        if is_prime(n)
          sum += 1
          prime = n
      prime

    expect(find_prime_at(1)).toBe(2)
    expect(find_prime_at(4)).toBe(7)
    # http://www.bigprimes.net/cruncher/7927/
    expect(find_prime_at(1001)).toBe(7927)
