# CONTRIBUTING.md

## Contributing to Bronchodilator Diffusion Modeling

Thank you for your interest in contributing to this project! As this is my first GitHub project, I welcome all contributions, from bug reports to new features.

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/your-username/Modeling-the-diffusion-of-a-bronchodilator.git
   ```
3. **Create a branch** for your feature:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Types of Contributions

### 🐛 Bug Reports
- Use GitHub Issues to report bugs
- Include FreeFEM++ version and operating system
- Provide minimal code example that reproduces the issue
- Include error messages and expected vs. actual behavior

### 💡 Feature Requests
- Describe the feature and its benefits
- Explain use cases and potential implementation
- Consider backwards compatibility

### 📝 Documentation
- Fix typos, improve clarity
- Add examples or use cases
- Translate documentation
- Improve code comments

### 🔬 Scientific Contributions
- Validate mathematical models
- Propose new boundary conditions
- Add realistic parameter sets
- Compare with experimental data

### 💻 Code Contributions
- New geometry implementations
- Parameter optimization algorithms
- Visualization improvements
- Performance optimizations

## Development Guidelines

### Code Style
- Follow existing FreeFEM++ conventions
- Use descriptive variable names
- Add comments for complex mathematical operations
- Keep functions focused and readable

### Testing
- Test new features with the validation script
- Verify FreeFEM++ compilation
- Check visual output makes sense
- Test with different parameter ranges

### Commit Messages
Use clear, descriptive commit messages:
```
Add two-bifurcation geometry implementation

- Implement complex branching structure
- Add Robin boundary conditions
- Include parameter validation
- Update documentation
```

## Pull Request Process

1. **Update documentation** if needed
2. **Run validation script**: `./validate_project.sh`
3. **Test your changes** with different parameters
4. **Update README.md** if adding new features
5. **Create pull request** with clear description

### Pull Request Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Scientific validation

## Testing
- [ ] Validation script passes
- [ ] FreeFEM++ compilation successful
- [ ] Visual results verified

## Additional Notes
Any special considerations or future work
```

## Scientific Accuracy

When contributing scientific content:

- **Cite sources** for mathematical models
- **Validate physically** meaningful results
- **Check units** and dimensionless parameters
- **Compare** with literature when possible

## Questions and Support

- **GitHub Issues**: Technical questions and bugs
- **GitHub Discussions**: General questions and ideas
- **Email**: Direct contact for complex topics

## Recognition

Contributors will be acknowledged in:
- README.md contributor section
- Release notes for significant contributions
- Academic publications (if applicable)

## Code of Conduct

This project follows a simple code of conduct:

- **Be respectful** and constructive
- **Welcome newcomers** and different perspectives  
- **Focus on scientific accuracy** and code quality
- **Help others learn** FreeFEM++ and computational methods

Thank you for contributing to computational medicine and open science! 🚀