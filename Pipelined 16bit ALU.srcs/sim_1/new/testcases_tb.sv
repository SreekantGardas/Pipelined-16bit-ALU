import "DPI-C" function void alu_model(input byte unsigned opcode, input shortint unsigned A, input shortint unsigned B, output shortint unsigned pout, output byte unsigned pneg, output byte unsigned pzero);

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

shortint unsigned expected_ans;
byte unsigned expected_neg;
byte unsigned expected_zero;

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

always #5 clk = ~clk;
int errors = 0;


initial begin
    clk = 0;
    areset = 1;
    opcode = 0;
    A = 0;
    B = 0;
    Dest_Reg = 0;
    Src_Reg_A = 0;
    Src_Reg_B = 0;
    
    #15;
    
    areset = 0;
    $display("-----------Test Starting-----------");
    
    for(int i = 0; i < 100; i++) begin
        A = $urandom();
        B = $urandom();
        opcode = $urandom_range(0,7);
        Dest_Reg = 1;
        Src_Reg_A = 0;
        Src_Reg_B = 0;
         
        alu_model({5'b00000,opcode}, A, B, expected_ans, expected_neg, expected_zero);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        #1;
        
        if((outfinal != expected_ans) || (neg != expected_neg) || (zero != expected_zero)) begin
            $display("Test %0d Failed| Opcode: %0d   A: %0d   B: %0d", i, opcode, A, B);
            $display("Expected| Answer: %0d   Negative: %0d   Zero: %0d", expected_ans, expected_neg, expected_zero);
            $display("Actual| Answer: %0d   Negative: %0d   Zero: %0d", outfinal, neg, zero);
            errors++;
        end
    end
    
    $display("-----------Final Results-----------");
    if(errors == 0) begin
        $display("You have no errors!!");
    end else begin
        $display("You failed %0d testcases", errors);
    end
    $display("-----------End-----------");
    $finish;
end
endmodule
