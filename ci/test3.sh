#!/usr/bin/env bash

set -eux

# Starting from scratch...
git clean -xdf

# First build & run tests using SBT
sbt bin/test:assembly

# Build Mill using SBT
target/bin/mill devAssembly

# Second build & run tests using Mill
out/devAssembly/dest core.test
out/devAssembly/dest scalalib.test
out/devAssembly/dest scalajslib.test
out/devAssembly/dest integration.test
out/devAssembly/dest devAssembly