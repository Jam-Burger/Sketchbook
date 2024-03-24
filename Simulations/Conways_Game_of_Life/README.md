# Conway's Game of Life

This is an implementation of Conway's Game of Life in [programming language]. The Game of Life is a cellular automaton devised by the British mathematician John Horton Conway in 1970. It is a zero-player game, meaning that its evolution is determined by its initial state, requiring no further input.

## Rules

The game is played on a grid of cells, where each cell can be either alive or dead. The game evolves in generations, with each generation being determined by the following rules:

1. Birth: A dead cell with exactly three live neighbors becomes a live cell (comes to life) in the next generation.
2. Survival: A live cell with two or three live neighbors remains alive in the next generation.
3. Death: A live cell with fewer than two live neighbors dies (underpopulation) or with more than three live neighbors dies (overpopulation) in the next generation.
