`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: Selflearning
// Engineer: Muhammed Adel
// 
// Create Date: 08/04/2024 03:22:17 AM
// Design Name: 
// Module Name: PWM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: PWM implementation using FSM
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module PWM #(parameter period = 100, parameter period_On = 50)(
    input clk,
    input rst, 
    output reg dout
);

integer count = 0;   // Counter for the PWM period
integer ton = 0;     // Counter for the on-time duration
// State definitions for the FSM
localparam NEW_CYCLE = 2'b00;
localparam ON_CYCLE = 2'b01;   // Not used in the current logic
localparam OFF_CYCLE = 2'b10;
localparam INITIAL_CYCLE = 2'b11;

reg [1:0] state = INITIAL_CYCLE; // Initial state

// Reset handling logic
always @(posedge rst) begin
    if (rst == 1'b1) begin
        state <= INITIAL_CYCLE; // Transition to INITIAL_CYCLE state on reset
    end
end

// State machine logic
always @(posedge clk) begin
    case (state)
        INITIAL_CYCLE: begin
            // Initialize counters and output
            ton <= 0;
            count <= 0;
            dout <= 1'b0;
            state <= NEW_CYCLE; // Transition to NEW_CYCLE state
        end

        NEW_CYCLE: begin
            if (ton < period_On) begin
                // Increment counters and set output high during on-time
                count <= count + 1;
                ton <= ton + 5;
                dout <= 1'b1;
                state <= NEW_CYCLE; // Stay in NEW_CYCLE state
            end else begin
                // Transition to OFF_CYCLE state after on-time
                state <= OFF_CYCLE;
            end
        end

        OFF_CYCLE: begin
            if (count < period) begin
                // Increment counter and set output low during off-time
                count <= count + 1;
                dout <= 1'b0;
            end else begin
                // Transition to INITIAL_CYCLE state after the complete period
                state <= INITIAL_CYCLE;
            end
        end
    endcase
end

endmodule
