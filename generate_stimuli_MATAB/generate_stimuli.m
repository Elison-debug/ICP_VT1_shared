clear all;
num_of_matrix = 2;
num_A = zeros(8,4,num_of_matrix);
num_X = zeros(4,8,num_of_matrix);
% generate 64 random numbers. 
for i=1:num_of_matrix
    num_A(i) = randi([0, 255], 8, 4);
    num_X(i) = randi([0, 255], 4, 8);
end
 
matrix_A_1 = reshape(num_A(1 :32),8,4); 
matrix_A_2 = reshape(num_A(33:64),8,4);
matrix_X_1 = reshape(num_X(1 :32),4,8); 
matrix_X_2 = reshape(num_X(33:64),4,8);

result_1 = matrix_X_1 * matrix_A_1;
result_2 = matrix_X_2 * matrix_A_2;

% open the file and write in
fid_A = fopen('user/data/A_input.txt', 'w');
if fid_A == -1
    error('can not get access to the A file');
end

fid_X = fopen('user/data/X_input.txt', 'w');
if fid_X == -1
    error('can not get access to the A file');
end

fid_result = fopen('user/data/result.txt', 'w');
if fid_result == -1
    error('can not get access to the result file');
end

% every number occupy one single row. 
fprintf(fid_A, '%d\n', num_A);
fprintf(fid_X, '%d\n', num_X);
fprintf(fid_result, '%d\n', result_1);
fprintf(fid_result, '%d\n', result_2);

% close the file. 
fclose(fid_A);
fclose(fid_X);
fclose(fid_result);
