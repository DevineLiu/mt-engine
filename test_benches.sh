#!/bin/bash
set -e

echo -e "\033[0;34m=== MT-Engine Full Performance Shootout Matrix ===\033[0m"

# Switch to core directory
cd mt-engine-core

# 1. Sparse Matrix
echo -e "\n\033[0;32m[Step 1] Sparse Node shootout (Snapshot OFF vs ON)...\033[0m"
cargo bench --bench matching_engine -- MixedWorkload/Sparse_Mixed
cargo bench --bench matching_engine --features snapshot -- MixedWorkload/Sparse_Snapshot_Enabled_Mixed

# 2. Dense Matrix
echo -e "\n\033[0;32m[Step 2] Dense Node shootout (Optimized)...\033[0m"
cargo bench --bench matching_engine --features dense-node -- MixedWorkload/Dense_Mixed

# Note: Snapshot (export) and Dense-node are mutually exclusive to ensure zero-cost.
# For dense persistence, use the 'serde' feature for direct binary state mapping.

echo -e "\n\033[0;34m=== Performance Matrix Evaluation Completed ===\033[0m"
