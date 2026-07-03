# 16-bit Pipelined ALU | Architectural Design & RTL Implementation

## Project Overview
This repository features a cycle-accurate, **16-bit Pipelined Arithmetic Logic Unit (ALU)** engineered for optimal throughput and timing closure. The design centers on advanced **computer architecture** principles, specifically focusing on **pipeline stage efficiency** and robust **hazard detection**. The implementation explores the trade-offs between logic depth, resource utilization, and operational frequency in an FPGA-based design environment.

## Technical Specifications
*   **Pipeline Architecture:** Multi-stage instruction execution to maximize **Instruction Level Parallelism (ILP)** and throughput.
*   **Hazard Detection Unit:** Implements deterministic logic to monitor for **Data Hazards** (RAW/WAR/WAW) and structural conflicts, triggering stalls to ensure data integrity.
*   **RTL Design:** Developed using **Verilog** with a focus on synthesizable, low-latency logic paths.
*   **Verification Framework:** Utilizes **DPI-C (Direct Programming Interface)** to interface Verilog simulation with C-based Golden Models, ensuring bit-perfect validation of complex ALU arithmetic.

## Design Verification & Performance Analysis

## Pipelined Execution Waveforms
The waveform capture below validates the ALU's behavioral model, specifically demonstrating the cycle-accurate transition of the `opcode`, source operands (`A[15:0]`, `B[15:0]`), and the resulting `outfinal` register output.

![ALU Execution Waveforms](image_3dd739.png)

## Hazard Mitigation Logic
To prevent invalid data propagation, the design incorporates a centralized Hazard Detection Unit. This capture details the `stall` signal assertion, demonstrating active management of pipeline registers (`dest1`, `dest2`, `Src_Reg_A`, `Src_Reg_B`) when data dependencies are detected.

![Hazard Stall Logic](image_3dd73f.png)

## Hazard Analysis & Pipeline Throughput
I implemented a performance characterization script using Python to visualize the relationship between signal magnitude and pipeline stalls. This plot identifies "pipeline bubbles," providing a quantitative basis for further architectural optimization.

![Hazard Analysis Plot](image_3dd73f.png)

## Technical Stack
*   **Hardware Description:** Verilog/SystemVerilog
*   **Verification:** C-based Golden Models, DPI-C Interface
*   **Simulation & Synthesis:** Vivado/XSim
*   **Data Analysis:** Python (Matplotlib/Pandas) for pipeline metrics
