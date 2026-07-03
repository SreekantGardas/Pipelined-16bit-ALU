module uart_fsm(
input logic clk,
input logic reset,
input logic [15:0] data_in,
input logic ready,
input logic busy,
output logic [7:0] data_out,
output logic start_reading
    );
    
parameter[2:0] start = 0, first = 1, first_wait = 2, second = 3, second_wait = 4, complete = 5;
logic [2:0] state, nstate;
always_comb begin
    case(state)
        start: nstate = ready ? first : start;
        first: nstate = busy ? first_wait : first;
        first_wait: nstate = busy ? first_wait : second;
        second: nstate = busy ? second_wait : second;
        second_wait: nstate = busy ? second_wait : complete;
        complete: nstate = ready ? complete : start;
        default: nstate = start;
    endcase
end

always_ff @(posedge clk or posedge reset) begin
    if(reset) begin
        state <= start;
    end else begin
        state <= nstate;
    end
end

always_comb begin
    if(state == first) begin
        start_reading = 1;
        data_out = data_in[15:8];    
    end else if (state == first_wait) begin
        start_reading = 0;
        data_out = data_in[15:8];
    end else if(state == second) begin
        start_reading = 1;
        data_out = data_in[7:0];
    end else if (state == second_wait) begin
        start_reading = 0;
        data_out = data_in[7:0];
    end else begin
    start_reading = 0;
    data_out = 0;
    end
end
endmodule
