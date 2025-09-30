#!/bin/bash
# Run script for bronchodilator diffusion simulations
# Author: eva118

echo "=== Bronchodilator Diffusion Simulation Runner ==="
echo "Choose simulation type:"
echo "1. Single bronchi"
echo "2. One bifurcation"
echo "3. Two bifurcations (most interesting)"
echo "4. Run all simulations"

read -p "Enter your choice (1-4): " choice

case $choice in
    1)
        echo "Running single bronchi simulation..."
        FreeFem++ src/single_bronchi.edp
        ;;
    2)
        echo "Running one bifurcation simulation..."
        FreeFem++ src/one_bifurcation.edp
        ;;
    3)
        echo "Running two bifurcations simulation (most interesting version)..."
        FreeFem++ src/two_bifurcations.edp
        ;;
    4)
        echo "Running all simulations..."
        echo "1/3: Single bronchi..."
        FreeFem++ src/single_bronchi.edp
        echo "2/3: One bifurcation..."
        FreeFem++ src/one_bifurcation.edp
        echo "3/3: Two bifurcations..."
        FreeFem++ src/two_bifurcations.edp
        echo "All simulations completed!"
        ;;
    *)
        echo "Invalid choice. Please run the script again."
        exit 1
        ;;
esac

echo "Simulation(s) completed successfully!"
echo "Check the generated .txt files for numerical results."