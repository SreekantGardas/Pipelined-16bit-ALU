module alu(
input logic clk,
input logic areset,
input logic [2:0] opcode,
input logic [15:0] A,
input logic [15:0] B,
input logic [3:0] Dest_Reg,
input logic [3:0] Src_Reg_A,
input logic [3:0] Src_Reg_B,
output logic [15:0] outfinal,
output logic neg,
output logic zero,
output logic stall
    );

logic[2:0] op1;
logic[15:0] A1, B1;
logic[3:0] dest1, srcA1, srcB1;

always_ff@(posedge clk or posedge areset) begin
    if(areset) begin
        dest1 <= 0;
        op1 <= 0;
        A1 <= 0;
        B1 <= 0;
    end else if(stall)begin
        op1 <= 0;
        A1 <= 0;
        B1 <= 0;
    end else begin
        dest1 <= Dest_Reg;
        op1 <= opcode;
        A1 <= A;
        B1 <= B; 
    end
end

logic[15:0] out1;
   
always_comb begin
    case(op1)
        3'b000: out1 = A1 + B1;
        3'b001: out1 = A1 - B1;
        3'b010: out1 = A1 & B1;
        3'b011: out1 = A1 | B1;
        3'b100: out1 = A1 ^ B1;
        3'b101: out1 = A1 << B1[3:0];
        3'b110: out1 = A1 >> B1[3:0];
        3'b111: out1 = A1 == B1;
        default: out1 = 0;
    endcase
end

logic[15:0] out2;
logic[3:0] dest2;
always_ff@(posedge clk or posedge areset) begin
    if(areset) begin
        dest2 <= 0;
        out2 <= 0;
    end else begin
        dest2 <= dest1; 
        out2 <= out1;
    end
end

always_ff@(posedge clk or posedge areset) begin
    if(areset) begin
        outfinal <= 0;
    end else begin
        outfinal <= out2;
    end
end

always_comb begin
    neg = (outfinal[15] == 1);
    zero = (outfinal == 0);
end

always_comb begin
    if ( ((dest1 == Src_Reg_A) || (dest1 == Src_Reg_B)) && (dest1 != 0) ) begin
        stall = 1;
    end else if ( ((dest2 == Src_Reg_A) || (dest2 == Src_Reg_B)) && (dest2 != 0) ) begin
        stall = 1;
    end else begin
        stall = 0;
    end
end
endmodule
