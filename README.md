## PWM Module Project
## Project Overview
This project implements a Pulse Width Modulation (PWM) module using a Finite State Machine (FSM) in Verilog. The module generates a PWM signal with configurable period and on-time duration. The project includes the PWM module code and a testbench for simulation and verification.
The PWM module generates a PWM signal based on the input clock and reset signals. The PWM signal's period and on-time duration can be configured using parameters. The module uses an FSM to manage the different states of the PWM cycle.

## Parameters
period: The total period of the PWM signal.
period_On: The on-time duration within the PWM period.
Ports
input clk: The clock input.
input rst: The reset input (active high).
output reg dout: The PWM output signal.
FSM States
NEW_CYCLE: State to start a new cycle.
ON_CYCLE: (Defined but not used in the current implementation).
OFF_CYCLE: State for the off-time duration.
INITIAL_CYCLE: State for initialization.
Testbench Description
The testbench (tb_PWM.v) is used to simulate the PWM module and verify its functionality. It generates a clock signal, applies a reset signal, and monitors the output.

## Key Components                                        
Clock generation: A 100 MHz clock is generated using an always block.
Reset sequence: The reset signal is asserted and de-asserted to initialize the module.
Monitoring: The $monitor system task is used to print signal values during simulation.

## How to Run the Simulation
Open your preferred Verilog simulation tool (e.g., ModelSim, Vivado, etc.).
Load the PWM module (PWM.v) and the testbench (tb_PWM.v).
Compile the design and the testbench.
Run the simulation.
Observe the output waveform and the printed signal values to verify the PWM module's behavior.

## Example Output                    
When running the testbench, you should see the dout signal toggling according to the configured period and period_On parameters. The signal transitions should match the state transitions defined in the FSM.
