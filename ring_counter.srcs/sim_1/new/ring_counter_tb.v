`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 07:00:03
// Design Name: 
// Module Name: ring_counter_tb
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

module tb_ring_counter;

  // Testbench signals
  reg clk;
  reg init;
  wire [7:0] count;

  // Instantiate the ring_counter module
  ring_counter uut (
    .clk(clk),
    .init(init),
    .count(count)
  );

  // Clock generation (10ns period -> 100MHz)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus
  initial begin
    // Monitor the output
    $monitor("Time = %0t | init = %b | count = %b", $time, init, count);

    // Initial state
    init = 0;
    #12;          // Wait a bit

    init = 1;     // Apply init pulse
    #10;

    init = 0;     // Clear init

    // Let it run for a while
    #100;

    $finish;
  end

endmodule
