"""Simple function to update TOMLs. 
"""
import sys

from toml import load, dumps
from deepmerge import always_merger

# Further modify TOML merge strategies via 'deepmerge.Merger'
toml_merger = always_merger


if __name__ == '__main__': 
    _, f1, f2, *args = sys.argv

    toml1 = load(f1)
    toml2 = load(f2)

    toml_merger.merge(toml1, toml2)
    print(dumps(toml1))
