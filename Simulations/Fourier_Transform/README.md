# Fourier Transform Simulation

This simulation explores the fascinating connection between Fourier transforms and epicycles. Fourier transforms decompose a complex signal into its constituent frequencies, while epicycles represent the motion of a point on a circle traced by another smaller circle. This simulation demonstrates how a combination of these smaller epicycles can approximate the original signal.

## Understanding the Algorithm

### Discrete Fourier Transform (DFT)

- The core of this simulation is the DFT, which takes a discrete signal (a series of data points) and transforms it into the frequency domain.
- Each frequency component in the transformed signal corresponds to a specific oscillation rate present in the original signal.
- The DFT provides information about the amplitudes and phases of these frequencies.

### Epicycle Representation

- Each frequency component in the DFT result can be visualized as an epicycle.
- An epicycle is a small circle centered at a specific radius and angle in the complex plane.
- The radius represents the amplitude of the frequency, and the angle represents its phase.
- By summing the positions of points on these epicycles at a given time, we can reconstruct an approximation of the original signal.

## Demo

![Fourier Transform Simulation Demo](FT_dragon.gif)
