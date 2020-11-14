function result = Tribonacci(n)
    if n == 0
        result = 0;
    end
    if n == 1
        result = 0;
    end
    if n == 2
        result = 1;
    end
    if n > 2
        result = Tribonacci(n-1) + Tribonacci(n-2) + Tribonacci(n-3);
    end
end