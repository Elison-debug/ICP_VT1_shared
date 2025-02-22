function A_rom(bin_A)

    % 检查输入参数尺寸
    if numel(bin_A) ~= 32
        error('bin_A 的元素个数必须为 32.');
    end

    filename = 'user/data/A_rom.v';
    fid = fopen(filename, 'w');
    if fid == -1
        error('无法打开文件 %s', filename);
    end

    % 写入模块头部
    fprintf(fid, 'module A_rom(\n');
    fprintf(fid, '    input  clk,\n');
    fprintf(fid, '    input  rst,\n\n');
    fprintf(fid, '    input  [3:0]  rom_addr,\n');
    fprintf(fid, '    output [13:0] A_input\n');
    fprintf(fid, ');\n\n');

    for col = 1:4
        for row = 1:8
            index = (col-1)*8 + row; % 当前参数在 bin_A 中的索引
            param_name = sprintf('num_%d_%d', row, col);
            fprintf(fid, '    parameter %s = 7''b%s;\n', param_name, bin_A(index));
        end
        fprintf(fid, '\n');
    end

    % 写入后续模块代码
    fprintf(fid, '    reg [13:0] rom_out;\n');
    fprintf(fid, '    reg [13:0] rom_out_next;\n');
    fprintf(fid, '    assign A_input = rom_out;\n\n');

    fprintf(fid, 'always @(posedge clk or negedge rst) begin\n');
    fprintf(fid, '    if(!rst) begin\n');
    fprintf(fid, '        rom_out <= 14''b0;\n');
    fprintf(fid, '    end\n');
    fprintf(fid, '    else begin\n');
    fprintf(fid, '       rom_out <= rom_out_next;\n');
    fprintf(fid, '    end\n');
    fprintf(fid, 'end\n\n');

    fprintf(fid, 'always @(*) begin\n');
    fprintf(fid, '    case (rom_addr)\n');

    % column 1（rom_addr: 0~3）
    fprintf(fid, '        //column 1\n');
    fprintf(fid, '        4''b0000 : rom_out_next = {num_1_1 , num_2_1};\n');
    fprintf(fid, '        4''b0001 : rom_out_next = {num_3_1 , num_4_1};\n');
    fprintf(fid, '        4''b0010 : rom_out_next = {num_5_1 , num_6_1};\n');
    fprintf(fid, '        4''b0011 : rom_out_next = {num_7_1 , num_8_1};\n');
    
    % column 2（rom_addr: 4~7）
    fprintf(fid, '        //column 2\n');
    fprintf(fid, '        4''b0100 : rom_out_next = {num_1_2 , num_2_2};\n');
    fprintf(fid, '        4''b0101 : rom_out_next = {num_3_2 , num_4_2};\n');
    fprintf(fid, '        4''b0110 : rom_out_next = {num_5_2 , num_6_2};\n');
    fprintf(fid, '        4''b0111 : rom_out_next = {num_7_2 , num_8_2};\n');
    
    % column 3（rom_addr: 8~11）
    fprintf(fid, '        //column 3\n');
    fprintf(fid, '        4''b1000 : rom_out_next = {num_1_3 , num_2_3};\n');
    fprintf(fid, '        4''b1001 : rom_out_next = {num_3_3 , num_4_3};\n');
    fprintf(fid, '        4''b1010 : rom_out_next = {num_5_3 , num_6_3};\n');
    fprintf(fid, '        4''b1011 : rom_out_next = {num_7_3 , num_8_3};\n');
    
    % column 4（rom_addr: 12~15）
    fprintf(fid, '        //column 4\n');
    fprintf(fid, '        4''b1100 : rom_out_next = {num_1_4 , num_2_4};\n');
    fprintf(fid, '        4''b1101 : rom_out_next = {num_3_4 , num_4_4};\n');
    fprintf(fid, '        4''b1110 : rom_out_next = {num_5_4 , num_6_4};\n');
    fprintf(fid, '        4''b1111 : rom_out_next = {num_7_4 , num_8_4};\n');
    fprintf(fid, '        default : rom_out_next = 14''b0;\n');
    fprintf(fid, '    endcase\n');
    fprintf(fid, 'end\n\n');

    fprintf(fid, 'endmodule\n');

    fclose(fid);
end
