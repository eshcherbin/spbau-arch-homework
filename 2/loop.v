module loop(clk, reset, ready, out, a, b);
    input clk, reset;
    input [7:0] a;
    input [7:0] b;
    output [15:0] out;
    output ready;

    reg [15:0] cur_a, cur_b, sum;

    assign out = sum;
    assign ready = cur_b == 0;

    initial begin
        cur_a <= 0;
        cur_b <= 0;
    end

    always @(posedge clk) begin
        if (reset == 1) begin
            cur_a[7:0] <= a[7:0];
            cur_a[15:8] <= 0;
            cur_b[7:0] <= b[7:0];
            cur_b[15:8] <= 0;
            sum[15:0] <= 0;
        end
        else begin
            if (cur_b[0] == 1)
                sum <= sum + cur_a;
            cur_a <= cur_a << 1;
            cur_b <= cur_b >> 1;
        end
    end

endmodule
