% generate 64 random numbers. 
nums = randi([0, 255], 64, 1);

% open the file and write in
fid = fopen('stimulit.txt', 'w');
if fid == -1
    error('can not get access to the file');
end

% every number occupy one single row. 
fprintf(fid, '%d\n', nums);

% close the file. 
fclose(fid);
