module alu_tb(
    );
    
logic[2:0] inOp;
logic[15:0] inA;
logic[15:0] inB;
logic[15:0] finOut;

alu test(.opcode(inOp), .A(inA), .B(inB), .out(finOut));

initial begin
    inOp = 3'b000;
    inA = 5;
    inB = 6;
    #10;
    $display("Answer: %0d", finOut);
    
    inOp = 3'b001;
    inA = 6;
    inB = 5;
    #10;
    $display("Answer: %0d", finOut);
    
    inOp = 3'b010;
    inA = 2;
    inB = 2;
    #10;
    $display("Answer: %0d", finOut);
    
    inOp = 3'b101;
    inA = 1;
    inB = 1;
    #10;
    $display("Answer: %0d", finOut);
    $finish;
end
endmodule
