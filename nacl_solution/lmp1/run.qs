#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --gres=gpu:1
#SBATCH --time=1:00:00
#SBATCH --job-name=sample
#SBATCH --account=Sis24_baroni
#SBATCH --partition=boost_usr_prod
#SBATCH --mail-user=cesare.notimportant@gmail.com
#SBATCH --mail-type=ALL

source /leonardo/home/userexternal/cmalosso/deepmd/how2install/moduli_lammps.sh

cd ${SLURM_SUBMIT_DIR}
echo $SLURM_SUBMIT_DIR

OMP_NUM_THREADS=8 mpirun -np 1 /leonardo/home/userexternal/cmalosso/deepmd/lammps-stable_2Aug2023/src/lmp_mpi -i in.lammps
