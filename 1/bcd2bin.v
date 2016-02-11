module bcd2bin(out, in);
    input [7:0] in;
    output [7:0] out;
    
    wire [7:0] b, a_sh3, a_sh1, tmp;
    wire [1:0] tmp_carry;

    assign b[3:0] = in[3:0];
    assign b[7:4] = 0;

    assign a_sh1[4:1] = in[7:4];
    assign a_sh1[7:5] = 0;
    assign a_sh1[0] = 0;

    assign a_sh3[6:3] = in[7:4];
    assign a_sh3[7] = 0;
    assign a_sh3[2:0] = 0;

    full_adder_8bit fa8b_1(tmp, tmp_carry[0], b, a_sh1, 1'b0);
    full_adder_8bit fa8b_2(out, tmp_carry[1], tmp, a_sh3, 1'b0);

endmodule
