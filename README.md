# CobolEuler

A collection of [Project Euler](https://projecteuler.net/) problem solutions implemented in COBOL using GnuCOBOL.

## Project Structure

```
src/
├── Euler1.cbl         # Problem 1: Sum of multiples of 3 or 5 below 1000
├── Euler2.cbl         # Problem 2: Sum of even-valued Fibonacci terms up to 4,000,000
├── Euler3.cbl         # Problem 3: Largest prime factor of 600,851,475,143
├── Euler48.cbl        # Problem 48: Self powers
├── library/
    └── is_prime.cbl   # Reusable library for prime number testing
```

## Building

### Prerequisites
- [GCC gcobol](https://gcc.gnu.org/onlinedocs/gcobol/gcobol.html)
- `make` utility

### Build Commands

Build all solutions:
```bash
cd src
make
```

Build a specific solution:
```bash
make Euler1
```

Clean compiled binaries:
```bash
make clean
```

## Running

Execute any solution:
```bash
cd src
./Euler1
./Euler2
./Euler3
./Euler48
```

## Adding New Solutions

1. Create a new COBOL source file (e.g., `Euler<number>.cbl`)
2. If your solution needs library functions, add the library dependency in the Makefile:
   ```makefile
   PROG_LIBS_Euler<number> = library/libname.cbl
   ```
3. Run `make` to build the new solution

## Reusable Libraries

### is_prime (library/is_prime.cbl)

A utility module for testing whether a number is prime. Called by solutions that require prime number testing.

**Usage:**
```cobol
call 'is_prime' using test-value result
```

Where `test-value` is a binary-double number and `result` is a PIC X(1) field that will contain 'Y' or 'N'.
