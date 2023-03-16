clc; close all; clear;

tol = 1e-10;

test_1 = sqrt(1:100);
test_2 = round(sqrt(1:10));
test_3 = linspace(0, 1, 1000);

result_1 = task3(test_1, 1, 10, 2);
ref_1 = [2, 4, 6, 8, 10];
assert(!isnan(result_1));
assert(norm(result_1 - ref_1) < tol);

result_2 = task3(test_2, 0, 3, 1);
ref_2 = [1, 1, 2, 2, 2, 2, 3, 3, 3, 3];
assert(!isnan(result_2));
assert(norm(result_2 - ref_2) < tol);

result_3 = task3(test_3, 0, 1, 1);
ref_3 = [0, 1];
assert(!isnan(result_3));
assert(norm(result_3 - ref_2) < tol);