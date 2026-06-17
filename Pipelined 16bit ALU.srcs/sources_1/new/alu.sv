module alu(
input logic [2:0] opcode,
input logic [15:0] A,
input logic [15:0] B,
output logic [15:0] out
    );
    
always_comb begin
    case(opcode)
        3'b000: out = A + B;
        3'b001: out = A - B;
        3'b010: out = A & B;
        3'b011: out = A | B;
        3'b100: out = A ^ B;
        3'b101: out = A << B[3:0];
        3'b110: out = A >> B[3:0];
        3'b111: out = A == B;
        default: out = 0;
    endcase
end

endmodule
