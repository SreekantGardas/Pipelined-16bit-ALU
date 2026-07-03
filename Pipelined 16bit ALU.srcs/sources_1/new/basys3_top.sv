module basys3_top(
input logic clk,
input logic btnC,
input logic btnU,
input logic btnL,
input logic btnR,
input logic btnD,
input logic[15:0] sw,
output logic[15:0] led,
output logic RsTx
    );

logic [15:0] result;
logic [7:0] uart8;
logic busy_con;
logic start_con;
logic btnU_upd;

alu alu_main(.clk(clk), .areset(btnC), .opcode({btnL, btnD, btnR}), .A({8'b00000000, sw[7:0]}), .B({8'b00000000, sw[15:8]}), .Dest_Reg(0), .Src_Reg_A(0), .Src_Reg_B(0), .outfinal(result), .neg(), .zero(), .stall());
debouncer debouncer_main(.clk(clk), .button_in(btnU), .button_out(btnU_upd));
uart_fsm fsm_main(.clk(clk), .reset(btnC), .data_in(result + 16'd48), .ready(btnU_upd), .busy(busy_con), .data_out(uart8), .start_reading(start_con));
uart_tx uart_main(.clk(clk), .reset(btnC), .tx_start(start_con), .tx_data_in(uart8), .tx_active(busy_con), .tx_serial(RsTx), .tx_done());
assign led = result;
endmodule
