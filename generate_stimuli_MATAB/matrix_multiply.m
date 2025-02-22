clear all;
num_of_matrix = 2;

num_A  = zeros(8,4);
num_X  = zeros(4,8,num_of_matrix);
result = zeros(4,4,num_of_matrix);

bin_A  = strings(8*4,1);
bin_X  = strings(8*4*num_of_matrix,1);
bin_result= strings(4*4*num_of_matrix,1);
% generate 64 random numbers. 
num_A (:,:) = randi([0, 127], 8, 4);
for i=1:num_of_matrix
    num_X (:,:,i) = randi([0, 255], 4, 8);
    result(:,:,i) = num_X (:,:,i) * num_A;
end
for k=1:num_of_matrix
    for j=1:8 
        for i=1:4
            bin_X (k*32+j*4+i-36) = dec2bin(num_X (i,j,k),8);
        end
    end
end
    for j=1:4 
        for i=1:8
            bin_A (j*8+i-8) = dec2bin(num_A (i,j),7);
        end
    end
for k=1:num_of_matrix
    for j=1:4
        for i=1:4
           bin_result (k*16+j*4+i-20) = dec2bin(result (i,j,k),18);
        end
    end
end

% open the file and write in
fid_A = fopen('user/data/A_input.txt', 'w');
if fid_A == -1
    error('can not get access to the A file');
end

fid_X = fopen('user/data/X_input.txt', 'w');
if fid_X == -1
    error('can not get access to the x file');
end

fid_result = fopen('user/data/result.txt', 'w');
if fid_result == -1
    error('can not get access to the result file');
end

fid_result_dec = fopen('user/data/result_dec.txt', 'w');
if fid_result == -1
    error('can not get access to the result file');
end

% every number occupy one single row. 
A_rom(bin_A);
fprintf(fid_A, '%s\r\n', bin_A);
fprintf(fid_X, '%s\r\n', bin_X);
fprintf(fid_result, '%s\r\n', bin_result);
fprintf(fid_result_dec, '%d\r\n', result);
% close the file. 
fclose(fid_X);
fclose(fid_result);
