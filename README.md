# Modeling the Diffusion of a Bronchodilator

This project simulates the transport and diffusion of bronchodilator medication in respiratory airways using computational fluid dynamics. The simulation uses FreeFEM++ to solve a heat equation with advection term, incorporating Robin boundary conditions to model realistic wall interactions.

## 🫁 Project Overview

This is my first GitHub project, implementing various versions of bronchodilator diffusion simulations:

- **Single bronchi**: Basic airway simulation
- **One bifurcation**: Y-shaped branching airway
- **Two bifurcations**: Complex tree-like structure (**most interesting version**)

The model simulates how inhaled medication spreads through airways, considering both diffusion and convective transport, with adjustable boundary conditions for different physiological scenarios.

## 🧮 Mathematical Model

The concentration `u(x,y,t)` of bronchodilator satisfies:

```
∂u/∂t = D∇²u - v·∇u
```

**Boundary Conditions:**
- **Robin conditions on walls**: `αu + β(∂u/∂n) = g` (mix of Neumann and Dirichlet)
- **Inlet**: Constant concentration injection
- **Outlets**: Natural boundary conditions

See [Mathematical Model Documentation](docs/mathematical_model.md) for detailed equations and parameter descriptions.

## 🛠️ Requirements

- **FreeFEM++** (version 4.0 or higher)
- Linux/macOS/Windows with FreeFEM++ installation
- Basic terminal/command line access

### Installing FreeFEM++

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get update
sudo apt-get install freefem++
```

**macOS:**
```bash
brew install freefem
```

**Windows:**
Download from [FreeFEM++ official website](https://freefem.org/download/)

## 🚀 Quick Start

1. **Clone the repository:**
```bash
git clone https://github.com/eva118/Modeling-the-diffusion-of-a-bronchodilator.git
cd Modeling-the-diffusion-of-a-bronchodilator
```

2. **Run a simulation:**
```bash
# Interactive menu
./run_simulation.sh

# Or run directly
FreeFem++ src/two_bifurcations.edp  # Most interesting version
```

3. **View results:**
- Visual plots appear during simulation
- Numerical results saved to `.txt` files
- Mesh and concentration distributions displayed

## 📁 Project Structure

```
├── src/
│   ├── single_bronchi.edp      # Single airway simulation
│   ├── one_bifurcation.edp     # Y-shaped bifurcation
│   ├── two_bifurcations.edp    # Complex tree (most interesting)
│   └── parameters.edp          # Parameter configurations
├── examples/
│   ├── high_absorption.edp     # Strong wall absorption scenario
│   └── flow_dominated.edp      # High-velocity transport
├── docs/
│   └── mathematical_model.md   # Detailed mathematical documentation
├── run_simulation.sh           # Interactive simulation runner
└── README.md
```

## 🎯 Key Features

### Multiple Geometries
- **Single bronchi**: Rectangular domain for basic validation
- **One bifurcation**: Y-shaped branching for flow division studies  
- **Two bifurcations**: Tree-like structure with 4 terminal branches (most realistic)

### Adjustable Parameters
- **Diffusion coefficient** (D): Controls spreading rate
- **Advection velocity** (v): Controls flow speed
- **Robin parameters** (α, β): Control wall absorption/reflection
- **Time stepping**: Configurable for stability and accuracy

### Boundary Condition Flexibility
- **Pure absorption**: High α, low β (drug absorbed by walls)
- **Pure reflection**: Low α, high β (drug reflects from walls)  
- **Mixed Robin**: Both α and β significant (realistic physiology)

## 📊 Example Results

The simulations produce:
- **Real-time visualization** of concentration evolution
- **Mesh plots** showing airway geometry
- **Numerical data** files for post-processing
- **Statistics** (total mass, average concentration)

### Parameter Scenarios
1. **Standard**: Balanced diffusion and advection
2. **High diffusion**: Rapid spreading, smooth profiles
3. **Flow-dominated**: Sharp fronts, transport-controlled
4. **High absorption**: Wall depletion effects
5. **Reflection**: Reduced wall gradients

## 🔬 Scientific Applications

- **Drug delivery optimization**: Inhaler design and dosing
- **Respiratory therapy**: Treatment planning
- **Biomedical research**: Understanding airway transport
- **Educational**: Demonstrating PDE solutions and finite elements

## 🎓 Learning Outcomes

This project demonstrates:
- **Partial Differential Equations**: Heat equation with convection
- **Finite Element Method**: Numerical solution techniques
- **Boundary Conditions**: Robin (mixed) conditions implementation
- **FreeFEM++ Programming**: Mesh generation and PDE solving
- **Scientific Computing**: Parameter studies and visualization

## 📈 Future Enhancements

Potential extensions:
- 3D geometry modeling
- Particle tracking (Lagrangian approach)
- Turbulence modeling
- Multiple drug species
- Patient-specific geometries from medical imaging
- Optimization algorithms for dosing

## 🤝 Contributing

As this is my first GitHub project, I welcome:
- Bug reports and fixes
- Parameter suggestions
- New geometry implementations
- Documentation improvements
- Scientific validation studies

Please open issues or submit pull requests!

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙋‍♀️ Author

**eva118** - *First GitHub project*

## 🙏 Acknowledgments

- FreeFEM++ development team
- Computational fluid dynamics community
- Respiratory medicine researchers

---

*This project represents the implementation of various bronchodilator diffusion scenarios, with the two-bifurcation version being the most interesting and clinically relevant.*
