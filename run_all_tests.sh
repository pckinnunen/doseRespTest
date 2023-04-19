#!/bin/bash
set -e -x

# Run all tests and calculate coverage.
coverage run --source=./demo_repo -m pytest
coverage html
coverage report

# Upload code coverage to CodeCov.
bash <(curl -s https://codecov.io/bash)

# Check notebooks.
pushd notebooks
./run_notebook_tests.sh
popd
