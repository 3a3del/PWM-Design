`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2024 04:26:17 AM
// Design Name: 
// Module Name: PWM_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module PWM_tb;

  // Testbench signals
  reg clk;
  reg rst;
  wire dout;

  // Instantiate the PWM module
  PWM #( .period(100), .period_On(50) ) uut (
      .clk(clk),
      .rst(rst),
      .dout(dout)
  );

  // Clock generation
  always #5 clk = ~clk; // 100 MHz clock

  // Initial block to apply stimulus
  initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    // Monitor output for a few cycles
    #100000;
     rst = 1; // Apply reset
    // End of simulation
    $stop;
  end

  // Monitor signals
  initial begin
    $monitor("Time: %0t | rst: %b | dout: %b | count: %0d | ton: %0d | state: %b",
              $time, rst, dout, uut.count, uut.ton, uut.state);
  end

endmodule

