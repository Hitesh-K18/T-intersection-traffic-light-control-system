`timescale 1ns/10ps

module TB;
reg clk,rst;
wire [2:0]light_M1;
wire [2:0]light_S;
wire [2:0]light_MT;
wire [2:0]light_M2;
Traffic_Light_Controller dut(.clk(clk) , .rst(rst) , .light_M1(light_M1) , .light_Side(light_S)  ,.light_M2(light_M2),.light_M1Turn(light_MT)   );
initial
begin
    clk=1'b0;
   // forever #(1000000000/2) clk=~clk;
    forever #(0.5) clk=~clk;
end

initial
begin
    rst=0;
    #(10);
    rst=1;
    #10;
    rst=0;
    #(100000);
    $finish;
    end

endmodule