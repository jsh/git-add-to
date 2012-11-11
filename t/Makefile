# Run tests

PATH := :..:$(PATH)
all_tests := $(basename $(wildcard *.t) .t)

# "make foo" runs "./foo.t"
% :
	./$*.t

# run all the tests in this directory
default: $(all_tests)

.PHONY: default
