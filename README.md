# 4-to-1 Multiplexer

A 4-to-1 multiplexer implemented in Verilog and Logisim, based on the supplied lab PDF.

## Files

- `4to1mux.v`: Verilog module `mux4to1`.
- `4to1mux_tb.v`: Testbench `mux4to1_tb` with the PDF's four test cases.
- `4to1mux.circ`: Logisim circuit with two NOT gates, four three-input AND gates, and one four-input OR gate. Matching tunnel labels connect signals without long wires.

## Operation

The select inputs choose which data input passes to `Y`:

| S1 | S0 | Y |
| --- | --- | --- |
| 0 | 0 | I0 |
| 0 | 1 | I1 |
| 1 | 0 | I2 |
| 1 | 1 | I3 |

Boolean expression (`~` means NOT, `&` means AND, `|` means OR):

```text
Y = (I0 & ~S1 & ~S0) | (I1 & ~S1 & S0)
  | (I2 & S1 & ~S0) | (I3 & S1 & S0)
```

## Requirements

- Icarus Verilog for compiling and running the Verilog simulation.
- GTKWave for viewing waveforms.
- Logisim 2.7.1 or a compatible version for opening the circuit.

## Run the Verilog Simulation

Extract the ZIP, then open a terminal in the extracted folder containing the files.

```bash
iverilog -s mux4to1_tb -o mux4to1.vvp 4to1mux.v 4to1mux_tb.v
vvp mux4to1.vvp
```

The simulation prints the results and creates `mux4to1.vcd` in the current folder.

To view the waveform:

```bash
gtkwave mux4to1.vcd
```

Add `I0`, `I1`, `I2`, `I3`, `S1`, `S0`, and `Y` to the waveform display.

## Expected Testbench Results

The testbench holds `I0=0`, `I1=1`, `I2=0`, and `I3=1`, changing the select inputs every 10 ns.

| I0 | I1 | I2 | I3 | S1 | S0 | Y |
| --- | --- | --- | --- | --- | --- | --- |
| 0 | 1 | 0 | 1 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 | 0 | 1 | 1 |
| 0 | 1 | 0 | 1 | 1 | 0 | 0 |
| 0 | 1 | 0 | 1 | 1 | 1 | 1 |

These four cases match the PDF; they do not exhaust all 64 binary input combinations.

## Open the Logisim Circuit

1. Open Logisim.
2. Select File > Open and choose `4to1mux.circ`.
3. Use the Poke Tool to toggle the data and select input pins.
4. Observe `Y` and compare it with the selection table above.

## Validation Status

The circuit file is well-formed XML. The Verilog simulation and Logisim circuit have not been run in the creation environment.
