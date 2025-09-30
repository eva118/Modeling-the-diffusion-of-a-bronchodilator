# Mathematical Model Documentation

## Overview
This project simulates the diffusion of a bronchodilator in respiratory airways using the heat equation with an advection term. The model incorporates Robin boundary conditions to simulate realistic wall interactions.

## Governing Equation
The concentration u(x,y,t) of the bronchodilator satisfies:

```
∂u/∂t = D∇²u - v·∇u
```

Where:
- `D` is the diffusion coefficient
- `v` is the advection velocity vector (primarily in x-direction)
- `∇²u` is the Laplacian (diffusion term)
- `v·∇u` is the advection term

## Boundary Conditions

### Robin Boundary Conditions on Walls
On the bronchi walls (label 1):
```
αu + β(∂u/∂n) = g
```

Where:
- `α` controls absorption/reaction at the wall
- `β` controls flux through the wall
- `∂u/∂n` is the normal derivative
- `g` is the boundary source term

**Physical Interpretation:**
- **α > 0, β = 0**: Pure absorption (Dirichlet-like)
- **α = 0, β > 0**: Pure flux (Neumann-like)  
- **α > 0, β > 0**: Mixed absorption and flux (Robin)

### Inlet Condition
Dirichlet boundary condition at the inlet:
```
u = u₀(t)  (typically u₀ = 1.0 for constant injection)
```

### Outlet Condition
Natural boundary condition (zero normal derivative).

## Geometries

### 1. Single Bronchi
- Simple rectangular domain representing one airway
- Length L = 10, Radius R = 1
- Useful for validating basic physics

### 2. One Bifurcation
- Y-shaped geometry with one branching point
- Main bronchi splits into two branches
- Demonstrates flow division and mixing

### 3. Two Bifurcations (Most Interesting)
- Complex tree-like structure with two branching levels
- Four terminal branches
- Most realistic representation of bronchial tree
- Shows complex flow patterns and concentration distributions

## Parameters

### Standard Parameters
- Diffusion coefficient: D = 0.1
- Advection velocity: v = 1.0
- Robin parameters: α = 1.0, β = 1.0
- Time step: dt = 0.01
- Final time: T = 2.0

### Parameter Sensitivity
The model behavior changes significantly with parameter values:

1. **High Diffusion (D >> v)**: Spreading dominates, smooth concentration profiles
2. **High Advection (v >> D)**: Sharp fronts, transport dominates
3. **High α**: Strong wall absorption, concentration depletion near walls
4. **High β**: Strong wall flux, reduced wall gradients

## Numerical Implementation

### Finite Element Method
- P1 (linear) finite elements
- Implicit time stepping for stability
- FreeFEM++ software platform

### Time Discretization
Backward Euler scheme:
```
(u^{n+1} - u^n)/dt = D∇²u^{n+1} - v·∇u^{n+1}
```

### Mesh Considerations
- Adaptive mesh density near boundaries
- Sufficient resolution for bifurcation regions
- Balanced element quality for numerical stability

## Physical Insights

### Bronchodilator Transport
1. **Initial Phase**: Rapid advection along main airways
2. **Branching**: Flow division at bifurcations creates complex patterns
3. **Wall Interaction**: Robin conditions simulate drug absorption
4. **Equilibrium**: Balance between injection, transport, and absorption

### Clinical Relevance
- Models inhaled medication delivery
- Predicts drug distribution in airways
- Helps optimize dosing strategies
- Assists in inhaler design