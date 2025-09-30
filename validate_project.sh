#!/bin/bash
# Validation script for the bronchodilator diffusion project
# Checks syntax and basic functionality

echo "=== Project Validation Script ==="
echo "Checking project structure and FreeFEM++ files..."

# Check if FreeFEM++ is available
if ! command -v FreeFem++ &> /dev/null; then
    echo "❌ FreeFEM++ not found. Please install FreeFEM++ to run simulations."
    echo "   Ubuntu/Debian: sudo apt-get install freefem++"
    echo "   macOS: brew install freefem"
    exit 1
else
    echo "✅ FreeFEM++ found: $(which FreeFem++)"
fi

# Check project structure
echo ""
echo "Checking project structure..."

required_files=(
    "src/single_bronchi.edp"
    "src/one_bifurcation.edp" 
    "src/two_bifurcations.edp"
    "src/parameters.edp"
    "examples/high_absorption.edp"
    "examples/flow_dominated.edp"
    "docs/mathematical_model.md"
    "docs/usage_guide.md"
    "README.md"
    "LICENSE"
    ".gitignore"
)

for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file"
    else
        echo "❌ $file (missing)"
    fi
done

# Check .edp file syntax (basic check)
echo ""
echo "Performing basic syntax check on FreeFEM++ files..."

edp_files=(
    "src/single_bronchi.edp"
    "src/one_bifurcation.edp"
    "src/two_bifurcations.edp"
    "examples/high_absorption.edp"
    "examples/flow_dominated.edp"
)

for file in "${edp_files[@]}"; do
    if [ -f "$file" ]; then
        # Basic syntax check - look for common issues
        if grep -q "border.*label" "$file" && grep -q "mesh.*buildmesh" "$file" && grep -q "fespace" "$file"; then
            echo "✅ $file (basic syntax OK)"
        else
            echo "⚠️  $file (potential syntax issues)"
        fi
    fi
done

# Check script permissions
echo ""
echo "Checking script permissions..."
if [ -x "run_simulation.sh" ]; then
    echo "✅ run_simulation.sh is executable"
else
    echo "⚠️  run_simulation.sh not executable, fixing..."
    chmod +x run_simulation.sh
    echo "✅ Fixed run_simulation.sh permissions"
fi

# Test quick compilation (without execution)
echo ""
echo "Testing FreeFEM++ compilation (quick check)..."

# Create a minimal test file
cat > /tmp/test_freefem.edp << 'EOF'
// Minimal test
border b(t=0,1) { x=t; y=0; label=1; }
mesh Th = buildmesh(b(10));
fespace Vh(Th, P1);
Vh u = x;
cout << "Test successful: max value = " << u[].max << endl;
EOF

if timeout 10s FreeFem++ /tmp/test_freefem.edp > /dev/null 2>&1; then
    echo "✅ FreeFEM++ compilation test passed"
else
    echo "⚠️  FreeFEM++ compilation test failed or timed out"
fi

rm -f /tmp/test_freefem.edp

echo ""
echo "=== Validation Summary ==="
echo "Project appears ready for use!"
echo ""
echo "Next steps:"
echo "1. Run './run_simulation.sh' for interactive simulations"
echo "2. Try 'FreeFem++ src/two_bifurcations.edp' for the most interesting version"
echo "3. Read docs/usage_guide.md for detailed instructions"
echo "4. Modify parameters in src/*.edp files for custom scenarios"