import "DPI-C" function void alu_model(input bit[7:0] opcode, input bit[15:0] A, input bit[15:0] B, output[15:0] pout, output[7:0] pneg, output[7:0] pzero);

module testcases_tb(
    );
    
logic clk;
logic areset;
logic [2:0] opcode;
logic [15:0] A;
logic [15:0] B;
logic [3:0] Dest_Reg;
logic [3:0] Src_Reg_A;
logic [3:0] Src_Reg_B;
logic [15:0] outfinal;
logic neg;
logic zero;
logic stall;

alu test(
    .clk(clk),
    .areset(areset),
    .opcode(opcode),
    .A(A),
    .B(B),
    .Dest_Reg(Dest_Reg),
    .Src_Reg_A(Src_Reg_A),
    .Src_Reg_B(Src_Reg_B),
    .outfinal(outfinal),
    .neg(neg),
    .zero(zero),
    .stall(stall)
);
    
 
endmodule
