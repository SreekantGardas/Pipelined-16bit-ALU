module uart_tx #(
    parameter CLOCKS_PER_BIT = 10416 // 100 MHz / 9600 baud = 10416
)(
    input  logic       clk,
    input  logic       reset,
    input  logic       tx_start,    // FSM pulses this to start sending
    input  logic [7:0] tx_data_in,  // The 8-bit slice from your FSM
    output logic       tx_active,   // Tells FSM we are busy (tx_busy)
    output logic       tx_serial,   // The physical copper wire (RsTx)
    output logic       tx_done      // Pulses high when 1 byte is finished
);

    enum logic [2:0] {IDLE, START_BIT, DATA_BITS, STOP_BIT, CLEANUP} state;
    
    logic [13:0] clock_count;
    logic [2:0]  bit_index;
    logic [7:0]  tx_data;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state       <= IDLE;
            clock_count <= 0;
            bit_index   <= 0;
            tx_serial   <= 1'b1; // Idle line is HIGH in UART
            tx_done     <= 1'b0;
            tx_active   <= 1'b0;
        end else begin
            tx_done <= 1'b0; // Default to 0 unless finishing a byte
            
            case (state)
                IDLE: begin
                    tx_serial   <= 1'b1;
                    clock_count <= 0;
                    bit_index   <= 0;
                    
                    if (tx_start) begin
                        tx_active <= 1'b1;
                        tx_data   <= tx_data_in;
                        state     <= START_BIT;
                    end else begin
                        tx_active <= 1'b0;
                    end
                end
                
                START_BIT: begin
                    tx_serial <= 1'b0; // Start bit is LOW
                    if (clock_count < CLOCKS_PER_BIT - 1) begin
                        clock_count <= clock_count + 1;
                    end else begin
                        clock_count <= 0;
                        state       <= DATA_BITS;
                    end
                end
                
                DATA_BITS: begin
                    tx_serial <= tx_data[bit_index];
                    if (clock_count < CLOCKS_PER_BIT - 1) begin
                        clock_count <= clock_count + 1;
                    end else begin
                        clock_count <= 0;
                        if (bit_index < 7) begin
                            bit_index <= bit_index + 1;
                        end else begin
                            bit_index <= 0;
                            state     <= STOP_BIT;
                        end
                    end
                end
                
                STOP_BIT: begin
                    tx_serial <= 1'b1; // Stop bit is HIGH
                    if (clock_count < CLOCKS_PER_BIT - 1) begin
                        clock_count <= clock_count + 1;
                    end else begin
                        clock_count <= 0;
                        tx_done     <= 1'b1;
                        state       <= CLEANUP;
                    end
                end
                
                CLEANUP: begin
                    tx_active <= 1'b0;
                    state     <= IDLE;
                end
                
                default: state <= IDLE;
            endcase
        end
    end
endmodule