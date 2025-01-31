#!/bin/bash

#$-l rt_G.large=1
#$-l h_rt=2:00:00
#$-j y
#$ -o .log/log_metrics.txt
#$-cwd

source /etc/profile.d/modules.sh
module load singularitypro 
SINGULARITY_TMPDIR=$SGE_LOCALDIR singularity exec --nv \
--bind /groups/gcd50654/tier4/dataset/kitti:/groups/gcd50654/tier4/dataset/kitti \
--bind /groups/gcd50654/tier4/neural-scene-graphs:/groups/gcd50654/tier4/neural-scene-graphs \
/groups/gcd50654/tier4/neural-scene-graphs/nerf.sif \
bash scripts/metrics_bash.sh
