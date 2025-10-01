# Bronchodilator Simulation in Bronchi

## Description
This project simulates the effect of a bronchodilator in one or multiple bronchi using FreeFEM. The simulation is based on the heat equation, with the option to include an advection term, and supports Robin, Neumann, or Dirichlet boundary conditions. The goal is to visualize how the drug diffuses through the bronchial generations.

## Features
- Simulation of bronchodilator diffusion in 1, 2, or 3 bronchial generations
- Option to include or exclude advection effects
- Adjustable simulation parameters (time step, total simulation time)
- Choice of boundary conditions: Robin, Neumann, or Dirichlet

## Prerequisites
- [FreeFEM](https://freefem.org/) installed
- Basic understanding of PDEs and boundary conditions

## Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/simon-eva/bronchi_simulation.git
    ```
2. Move into the project folder
   ```bash
   cd bronchi_simulation
   ```

3.Open the FreeFEM script and select:
- The boundary conditions you want (others can be commented out)
- Whether to include the advection term
- Values of simulation parameters (time step, total simulation time)
4. Run the simulation
FreeFEM++ bronchi_simulation.edp
4. Check the output
- Visual mesh of the bronchi
- Time-step visualization of drug diffusion
-Color scale indicates relative drug density (not absolute values)

## Methodology
- The model is based on the heat equation, optionally including advection.
- Advection mainly affects the first bronchial generations due to the arrival speed of the drug, while its impact decreases in later generations.
- Robin boundary conditions simulate partial absorption at the bronchial walls, representing limited absorption capacity.

  ## Result
- Mesh visualization of the bronchial geometry
- Diffusion visualization at each time step
- Color scale shows regions of higher or lower drug concentration
## Contact
email: eva.simon.x23@polytechnique.edu
LinkdIn:https://www.linkedin.com/in/eva-simon-a5b715267/
github: simon-eva
