module debouncer(
input logic clk,
input logic button_in,
output logic button_out
    );
    
logic[21:0] counter = 0;
logic curr_level = 0;
logic last_level = 0;

always_ff @(posedge clk) begin
    if(button_in == 0) begin
        counter <= 0;
        curr_level <= 0;
    end else if (counter < 2000000) begin
        counter <= counter + 1;
        curr_level <= 0;
    end else begin
        counter <= counter;
        curr_level<= 1;
    end
    
    last_level <= curr_level;
    button_out <= curr_level & ~last_level;
end
endmodule
