import os
from os.path import join

# Config
x = config["x"]

# Paths
RESULTS = config["results"]

# Wildcards
wildcards = config["x"]

wildcard_constraints:
    x = "\w"


# Helper functions
def logfile(wildcards):
    """
    Generate a log file for each rule (via `params`). Because we can
    only call the rule name inside the shell directive, we need a dummy.

    Add the following params:
    params:
        log = logfile,

    Add the command below to the end of each `shell` directive:
    |& tee `echo {params.log} | sed 's/rulename/{rule}/g'`
    """
    wcs = [f"{key}-{value}" for key, value in wildcards.items()]
    wcs = "__".join(wcs)
    sep = "__" if wcs != "" else ""
    logfile = join("logs", f"rulename{sep}{wcs}.log")
    return logfile


# Pipeline
rule all:
    input:
        expand(join(RESULTS, "{wildcard}.out"), wildcard=x),


rule skeleton:
    input:
    output:
    params:
        log = logfile,
    threads:
    conda:
        "envs/env.yml",
    shell:
        """
        """
