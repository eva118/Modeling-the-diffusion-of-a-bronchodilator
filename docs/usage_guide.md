# Usage Guide

## Running Simulations

### Method 1: Interactive Script
```bash
./run_simulation.sh
```
Follow the menu to select:
1. Single bronchi
2. One bifurcation  
3. Two bifurcations (recommended)
4. All simulations

### Method 2: Direct Execution
```bash
# Most interesting version
FreeFem++ src/two_bifurcations.edp

# Other versions
FreeFem++ src/single_bronchi.edp
FreeFem++ src/one_bifurcation.edp

# Examples with special parameters
FreeFem++ examples/high_absorption.edp
FreeFem++ examples/flow_dominated.edp
```

## Parameter Modification

### In-file Parameter Changes
Edit the parameter values directly in the `.edp` files:

```cpp
// In any .edp file, modify these values:
real D = 0.1;        // Diffusion coefficient
real v = 1.0;        // Advection velocity  
real alpha = 1.0;    // Robin BC absorption parameter
real beta = 1.0;     // Robin BC flux parameter
real dt = 0.01;      // Time step
real T = 2.0;        // Final simulation time
```

### Using Parameter Files
Include the parameter configuration:
```cpp
include "src/parameters.edp"

// Then select a scenario
SelectParameters("high_diffusion")
```

Available scenarios:
- `"standard"`: Default balanced parameters
- `"high_diffusion"`: Fast spreading
- `"high_advection"`: Flow-dominated transport
- `"absorption"`: Strong wall absorption
- `"reflection"`: Strong wall reflection

## Output Files

Each simulation generates:
- **Visual plots**: Real-time concentration evolution
- **Text files**: `*_solution.txt` with numerical data
- **Console output**: Statistics and progress information

### Data Format
```
# x y concentration
0.0 0.0 1.000000
0.1 0.0 0.987654
...
```

## Troubleshooting

### FreeFEM++ Not Found
```bash
# Check installation
which FreeFem++

# If not found, install:
# Ubuntu/Debian:
sudo apt-get install freefem++

# macOS:
brew install freefem
```

### Simulation Crashes
1. **Reduce time step**: `dt = 0.005` instead of `dt = 0.01`
2. **Check parameters**: Ensure D > 0, dt > 0, T > dt
3. **Mesh issues**: Verify geometry doesn't have overlapping borders

### Slow Performance
1. **Reduce mesh density**: Lower numbers in `buildmesh()` calls
2. **Increase time step**: `dt = 0.02` (check stability)
3. **Shorter simulation time**: `T = 1.0`

## Visualization Tips

### Saving Plots
Add to your `.edp` file:
```cpp
// Save plot as PostScript
plot(u, ps="concentration_plot.eps");

// Save as PNG (if supported)
plot(u, value=true, fill=true, dim=3, ps="plot.eps");
```

### Custom Visualization
Modify plot parameters:
```cpp
plot(u, fill=true,          // Filled contours
     value=true,            // Show values
     dim=3,                 // 3D perspective
     cmm="Custom Title",    // Custom title
     wait=true);            // Wait for user input
```

## Advanced Usage

### Custom Geometries
Create new border definitions:
```cpp
// Custom bronchi shape
border custom(t=0, 1) { 
    x = L*t; 
    y = R*sin(2*pi*t);  // Sinusoidal walls
    label = 1; 
}
```

### Multiple Scenarios
Run parameter sweeps:
```cpp
for (int i = 1; i <= 5; i++) {
    real D = 0.1 * i;  // Vary diffusion
    // ... solve problem ...
    // ... save results with different names ...
}
```

### Data Analysis
Export for external analysis:
```cpp
{
    ofstream file("detailed_output.csv");
    file << "x,y,concentration,time" << endl;
    for (int i = 0; i < Th.nv; i++) {
        file << Th(i).x << "," << Th(i).y << "," 
             << u[][i] << "," << t << endl;
    }
}
```