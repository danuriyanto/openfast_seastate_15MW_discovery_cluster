# openfast_in_discovery_cluster
this is the curation of the codes that I use for preprocessing, processing, and post-processing openfast simulations in discovery cluster using matlab.

### Step 1: Create and Activate a New Conda Environment
Run the following commands to create a new Conda environment named `openfast-dev` and activate it:
```bash
conda create -n openfast-dev python=3.9 -y
conda activate openfast-dev
```

### Step 2: Download the `openfast-dev` Package
Download the appropriate `.conda` package file based on your operating system:

For **Linux**:
```bash
wget https://anaconda.org/conda-forge/openfast/files/linux-64/openfast-dev-h2da4d3d_185.conda
```

For **MacOS**:
```bash
wget https://anaconda.org/conda-forge/openfast/files/osx-arm64/openfast-dev-h2da4d3d_185.conda
```

### Step 3: Install the Downloaded Package
Use the following command to install the downloaded `.conda` package:
```bash
conda install ./openfast-dev-h2da4d3d_185.conda
```

### Step 4: Install Required Dependencies
Ensure that all necessary dependencies are installed.

For **Linux**:
```bash
conda install -c conda-forge libgfortran
```

For **MacOS**:
```bash
conda install -c conda-forge libgfortran libomp
```

### Step 5: Set Environment Variables (If Required)
If the `openfast` binary fails to find required libraries, set the `LD_LIBRARY_PATH` manually:
```bash
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH
```

To make this change persistent for the openfast-dev environment, create an activation script:
```bash
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
echo 'export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH' > $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
```

### Step 6: Verify the Installation
Check if the `openfast` binary is accessible and working by running:
```bash
openfast -v
