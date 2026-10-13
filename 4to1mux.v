module mux4to1 (
    input wire I0,
    input wire I1,
    input wire I2,
    input wire I3,
    input wire S0,
    input wire S1,
    output reg Y
);

always @(*) begin
    case ({S1, S0})
        2'b00: Y = I0;
        2'b01: Y = I1;
        2'b10: Y = I2;
        2'b11: Y = I3;
        default: Y = 1'b0;
    endcase
end

endmodule
