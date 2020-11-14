function sort = SortVec(input)
    sort = input;
    n = length(sort)-1;
    k = 0;
    for i = 1:1:n
        for j = 1:1:n
            if sort(j) > sort(j+1)
                k = sort(j);
                sort(j) = sort(j+1);
                sort(j+1) = k;
            end
        end
    end
end