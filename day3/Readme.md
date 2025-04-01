# Day 3: Understanding CPU Structure

In day 3, I learned about the structure and architecture of modern CPUs, which provides important context for understanding CUDA and GPU programming.

## Core Components of Modern CPUs

### Cores
- Modern CPUs range from 2 to 64 cores
- Optimized for high single-threaded performance
- Each core can independently execute instructions

### Cache Hierarchy
- **L1 Cache**: 
  - Fastest and smallest (16-64 KB per core)
  - Directly connected to each core
  - Stores the most crucial and frequently accessed data
  
- **L2 Cache**: 
  - Larger and slightly slower (256-512 KB per core)
  - Serves as a bridge between L1 and L3
  - Stores data that's too big for L1 but still important for performance
  
- **L3 Cache**: 
  - Shared among all cores (several MB) 
  - Provides a larger pool of cached data
  - Helps when multiple cores work on the same task and need to share data

### Why Cache Hierarchy Matters

- **L1 Cache** is used for very small, quick tasks that a single core is working on
- **L2 Cache** acts as a middle ground for tasks too big for L1 but not big enough to need L3
- **L3 Cache** is critical for heavy tasks, especially when multiple cores work together and share data
- This hierarchy ensures the CPU can access data quickly without waiting for it to come from the much slower main memory (RAM)

### Branch Prediction & Out-of-Order Execution

**Branch Prediction Explained:**
- When a CPU encounters a branch instruction (like an "if" statement or loop condition), it needs to decide which path to follow
- Branch prediction helps the CPU guess which path it will take before evaluating the condition

**How Branch Prediction Works:**
1. **Prediction**: The CPU guesses which direction the branch will go based on patterns and previous experience
2. **Speculative execution**: The CPU starts executing instructions along the predicted path
3. **Final Check**: If prediction was correct, execution continues without delay
4. **Misprediction**: If prediction was wrong, the CPU discards wrongly executed instructions and starts over

**Benefits of Branch Prediction:**
- Reduces wait time by not having to wait for condition checks
- Improves overall performance even with occasional mispredictions

**Out-of-Order Execution:**
- Allows CPU to execute instructions flexibly rather than in strict program order
- CPU can rearrange instruction order to maximize resource usage
- Results in better performance, higher throughput, and more efficient resource utilization

### Instruction Pipelines

- Divide instruction execution into several stages
- Allow multiple instructions to be processed simultaneously at different stages
- Increase throughput and CPU efficiency
- Enable the CPU to work on multiple instructions at the same time
- Modern CPUs use techniques like branch prediction to handle pipeline stalls and hazards

## CPU Architecture Diagram

Below is the CPU architecture diagram showing the relationship between cores, cache levels, and memory:

```
┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐
│  Core 1 │   │  Core 2 │   │  Core 3 │   │  Core 4 │
└────┬────┘   └────┬────┘   └────┬────┘   └────┬────┘
     │             │             │             │
┌────▼────┐   ┌────▼────┐   ┌────▼────┐   ┌────▼────┐
│ L1 Cache│   │ L1 Cache│   │ L1 Cache│   │ L1 Cache│
└────┬────┘   └────┬────┘   └────┬────┘   └────┬────┘
     │             │             │             │
     └─────────────┼─────────────┼─────────────┘
                   │             │
             ┌─────▼─────────────▼─────┐
             │       L2 Cache          │
             └───────────┬─────────────┘
                         │
                    ┌────▼────┐
                    │ L3 Cache│  Shared between cores
                    └────┬────┘
                         │
                    ┌────▼────┐
                    │   RAM   │  Main Memory
                    └────┬────┘
                         │
                    ┌────▼────┐
                    │ SSD/HDD │  Storage
                    └─────────┘

┌─────────────────────────────┐
│      Control Unit           │
│                             │
│  - Branch Predictor         │
│  - Out-of-Order Execution   │
└─────────────────────────────┘
```

The diagram illustrates how data flows through the CPU architecture, from the cores through the cache hierarchy, and to main memory and storage.
