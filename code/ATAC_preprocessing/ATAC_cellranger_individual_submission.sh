#!/bin/bash
#SBATCH --account p31535
#SBATCH --partition short
#SBATCH --job-name cellranger_atac
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 20
#SBATCH --mem 96G
#SBATCH --time 4:00:00
#SBATCH --output /projects/b1042/Gate_Lab/AD_APOE/logs/cellranger/atac/%x-%j.log
#SBATCH --verbose

# ${1} = ${fastq_dir}
# ${2} = ${sample}
# ${3} = ${id}
# ${3} = ${output_dir}

# Load cellranger
module load cellranger-atac/2.0.0

# Navigate to output directory
cd ${4}

# Run cellranger
cellranger-atac count \
--id=${3} \
--reference=/projects/b1169/nat/ncp_general/ref/refdata-cellranger-arc-GRCh38-2020-A-2.0.0 \
--fastqs=${1} \
--sample=${2} \
--localcores=16 \
--localmem=96
