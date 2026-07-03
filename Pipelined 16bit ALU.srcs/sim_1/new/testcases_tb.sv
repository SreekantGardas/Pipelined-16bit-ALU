import "DPI-C" function void alu_model(input byte unsigned opcode, input shortint unsigned A, input shortint unsigned B, output shortint unsigned pout, output byte unsigned pneg, output byte unsigned pzero);

module testcases_tb();

logic clk, areset;
logic [2:0] opcode;
logic [15:0] A, B;
logic [3:0] Dest_Reg, Src_Reg_A, Src_Reg_B;
logic [15:0] outfinal;
logic neg, zero, stall;

integer file_handle;

alu test(.*);

always #5 clk = ~clk;

logic [2:0] s_op1, s_op2;
logic [15:0] s_A1, s_A2, s_B1, s_B2;
logic [3:0] s_dest1, s_dest2;

initial begin
    shortint unsigned expected_ans;
    byte unsigned expected_neg, expected_zero;
    int i = 0, errors = 0;
    
    file_handle = $fopen("sim_data.csv", "w");
    $fdisplay(file_handle, "time,stall,opcode,outfinal");
    
    $dumpfile("alu_waves.vcd"); $dumpvars(0, testcases_tb);
    clk = 0; areset = 1; #15; areset = 0;

    while(i < 100) begin
        @(posedge clk); #1;
        
        $fdisplay(file_handle, "%0t,%d,%d,%d", $time, stall, opcode, outfinal);
        
        if(stall) begin
            s_op1 <= 0; s_A1 <= 0; s_B1 <= 0; s_dest1 <= 0;
            s_op2 <= 0; s_A2 <= 0; s_B2 <= 0; s_dest2 <= 0;
        end else begin
            s_op2 <= s_op1; s_A2 <= s_A1; s_B2 <= s_B1; s_dest2 <= s_dest1;
            
            A = $urandom(); B = $urandom(); opcode = $urandom_range(0,7);
            Dest_Reg = $urandom_range(1, 15);
            Src_Reg_A = $urandom_range(1, 15); Src_Reg_B = $urandom_range(1, 15);
            
            s_op1 <= opcode; s_A1 <= A; s_B1 <= B; s_dest1 <= Dest_Reg;
        end

        if(stall == 0 && i >= 2) begin 
            alu_model({5'b00000, s_op2}, s_A2, s_B2, expected_ans, expected_neg, expected_zero);
            
            if((outfinal !== expected_ans) || (neg !== expected_neg) || (zero !== expected_zero)) begin
                $display("Test %0d Failed | Opcode: %0d | Expected: %0d | Actual: %0d", i, s_op2, expected_ans, outfinal);
                errors++;
            end
            i++;
        end
    end
    
    $display("Simulation finished with %0d errors.", errors);
    $fclose(file_handle);
    $finish;
end
endmodule