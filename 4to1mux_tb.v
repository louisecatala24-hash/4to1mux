`timescale 1ns/1ps

module mux4to1_tb;
reg I0, I1, I2, I3;
reg S0, S1;
wire Y;

mux4to1 uut (
    .I0(I0), .I1(I1), .I2(I2), .I3(I3),
    .S0(S0), .S1(S1), .Y(Y)
);

initial begin
    $dumpfile("mux4to1.vcd");
    $dumpvars(0, mux4to1_tb);
    $display("I0 I1 I2 I3 | S1 S0 | Y");
    $display("-----------------------");

    I0=0; I1=1; I2=0; I3=1;
    S1=0; S0=0; #10;
    $display("%b  %b  %b  %b | %b  %b | %b", I0,I1,I2,I3,S1,S0,Y);

    S1=0; S0=1; #10;
    $display("%b  %b  %b  %b | %b  %b | %b", I0,I1,I2,I3,S1,S0,Y);

    S1=1; S0=0; #10;
    $display("%b  %b  %b  %b | %b  %b | %b", I0,I1,I2,I3,S1,S0,Y);

    S1=1; S0=1; #10;
    $display("%b  %b  %b  %b | %b  %b | %b", I0,I1,I2,I3,S1,S0,Y);

    $finish;
end
endmodule
