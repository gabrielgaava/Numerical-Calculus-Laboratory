// Define the function needed
function [result] = f(x)
    result = cos(%pi * (x + 1) / 8) + 0.148 * x - 0.9062;
endfunction

function [result] = fp(x)
    result = -0.125 * (%pi * sin(%pi * (x + 1) / 8) - 1.184);
endfunction

// Plot the graphic of the function
function plot_function(start, finish, window_id)
    x=[start:0.1:finish];
    
    show_window(window_id);
    plot(x, f(x));
    xgrid(2);
endfunction

// Two plots were plotted to identify the intervals for the real zeros
plot_function(-20, 20, 0);
plot_function(-1, 1, 1);

// Range considered
// [-1, 0]
// [0,  1]
// [9, 10]

printf("\n\n(1) - Ranges considered based on graphs:\n");
printf("1. [-1,  0]\n");
printf("2. [ 0,  1]\n");
printf("3. [ 9, 10]\n");

// Apply the bissection method for two iterrations
[raiz1, x1, iter1, ea1] = bisseccao(-1, 0, f, 0.000001, 2);
[raiz2, x2, iter2, ea2] = bisseccao(0,  1, f, 0.000001, 2);
[raiz3, x3, iter3, ea3] = bisseccao(9, 10, f, 0.000001, 2);

function [_range] = extract_last_range(list_of_points)
    start = list_of_points($-1);
    finish = list_of_points($);
    if (start < finish) then
        _range = [start, finish];
    else
        _range = [finish, start];
    end
endfunction

range1 = extract_last_range(x1);
range2 = extract_last_range(x2);
range3 = extract_last_range(x3);

printf("\n\n(2) - Ranges after two iterrations of bissection method:\n");
printf("1. [%5.5f,  %5.5f]\n", range1(1), range1(2));
printf("2. [%5.5f,  %5.5f]\n", range2(1), range2(2));
printf("3. [%5.5f,  %5.5f]\n", range3(1), range3(2));

// Apply newton-raphson with initial guess as the average
// tolerance = 0.000001 and max iteratins = 100

printf("\n\nTolerance used for Newton-Raphson = 0.000001 \n");

function [raiz, x, iter, ea] = nr(_range)
    guess = (_range(1) + _range(2)) / 2;
    [raiz, x, iter, ea] = newtonraphson(guess, f, fp, 0.000001, 100);
endfunction

[raiz1, x1, iter1, ea1] = nr(range1);
[raiz2, x2, iter2, ea2] = nr(range2);
[raiz3, x3, iter3, ea3] = nr(range3);

printf("\n\n(3) - Initial guess for the root in the range:\n");
printf("1. %5.5f\n", (range1(1) + range1(2)) / 2);
printf("2. %5.5f\n", (range2(2) + range2(2)) / 2);
printf("3. %5.5f\n", (range3(1) + range3(2)) / 2);

printf("\n\n(4) - Number of interractions for each range:\n");
printf("1. %3d\n", iter1);
printf("2. %3d\n", iter2);
printf("3. %3d\n", iter3);

printf("\n\n(5) - Final estimate for the root in the range:\n");
printf("1. %5.5f\n", raiz1);
printf("2. %5.5f\n", raiz2);
printf("3. %5.5f\n", raiz3);


