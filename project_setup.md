# Xschem + SKY130A + ngspice Quick Workflow

## 1. Create a Project Directory

```bash
mkdir project_name
cd project_name
```

Create a local `xschemrc` file:

```bash
echo 'source /usr/local/share/pdk/sky130B/libs.tech/xschem/xschemrc' > xschemrc
```

Launch a terminal:

```bash
xterm &
```

In the newly opened terminal:

```bash
xschem filename.sch
```

---

## 2. Draw the Schematic

- Use devices from the SKY130A PDK.
- Use `lab_pin.sym` for net labels.

Example net names:

```text
vdd
vin
vout
```

---

## 3. Create Voltage Sources

### DC Supply

For VDD:

```text
1.8 V
```

### Pulse Input

ngspice pulse syntax:

```text
PULSE(V1 V2 TD TR TF PW PER NP)
```

Example:

```text
PULSE(0 1.8 1ns 1ns 1ns 5ns 10ns)
```

Where:

| Parameter | Description |
|------------|------------|
| V1 | Initial Voltage |
| V2 | Final Voltage |
| TD | Delay Time |
| TR | Rise Time |
| TF | Fall Time |
| PW | Pulse Width |
| PER | Period |
| NP | Number of Cycles (Optional) |

---

## 4. Add Simulation Commands

Place a:

```text
code_shown.sym
```

symbol in the schematic.

Double-click it and set the `value` property to:

```spice
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.tran 0.1n 100n

.save all
```

### Explanation

Load SKY130 TT corner:

```spice
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
```

Run transient analysis:

```spice
.tran 0.1n 100n
```

Save all signals:

```spice
.save all
```

---

## 5. Generate the Netlist

From the top menu:

```text
Simulation → Show Netlist
```

Review the generated netlist.

If there are no errors:

```text
Netlist → Netlist
```

Save the generated netlist.

---

## 6. Run Simulation

Click:

```text
Simulation → Simulate
```

An ngspice interactive window should open.

---

## 7. Plot Waveforms

Inside the ngspice console:

```spice
plot v(vin) v(vout)
```

or

```spice
plot vin vout
```

This will display the inverter input and output waveforms.

---

## 8. If Simulation Window Does Not Open

Open:

```text
Simulation
    → Configure Simulator and Tools
```

Under:

```text
Ngspice Interactive
```

Enable the checkbox next to:

```text
Status
```

Apply changes and rerun the simulation.

---

## 9. Useful SKY130 ngspice Files

Location:

```bash
cd /usr/local/share/pdk/sky130A/libs.tech/ngspice/
```

List files:

```bash
ls
```

Important file:

```text
sky130.lib.spice
```

Supported corners:

```text
tt  = Typical-Typical
ff  = Fast-Fast
ss  = Slow-Slow
fs  = Fast-Slow
sf  = Slow-Fast
```

Example:

```spice
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice ff
```

Runs simulation at the FF corner.

---

## 10. Waveform Viewer Controls

| Action | Operation |
|----------|----------|
| Zoom In/Out | Mouse Wheel |
| Zoom Region | Right Click + Drag |
| Pan | Middle Click + Drag |
| Autoscale | Double Click |

---

# Example CMOS Inverter Testbench

### Input Source

```text
PULSE(0 1.8 1ns 100ps 100ps 5ns 10ns)
```

### Simulation Block

```spice
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.tran 0.1n 100n

.save all
```

### Plot Command

```spice
plot v(vin) v(vout)
```

Expected result:

- `vin` toggles between 0 V and 1.8 V.
- `vout` is the inverted version of `vin`.

---

# Useful Commands

Check ngspice installation:

```bash
which ngspice
ngspice -v
```

Check xschem installation:

```bash
which xschem
```

Check PDK installation:

```bash
ls /usr/local/share/pdk/
```

Check SKY130A model files:

```bash
ls /usr/local/share/pdk/sky130A/libs.tech/ngspice/
```
