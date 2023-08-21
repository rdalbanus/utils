import os


def logfile(wildcards):
    """
    Generate a log file for each rule (via `params`). Because we can
    only call the rule name inside the shell directive, we need a dummy.
    Add the command below to the end of each `shell` directive:
    |& tee `echo {params.log} | sed 's/rulename/{rule}/g'`
    """
    wcs = [f"{key}-{value}" for key, value in wildcards.items()]
    wcs = "__".join(wcs)
    sep = "__" if wcs != "" else ""
    logfile = join("logs", f"rulename{sep}{wildcards}.log")
    return logfile

