default: test

clean:
	rm -rf testrepo* */testrepo*

install:
	sudo ln git-add-to /usr/lib/git-core

test:
	$(MAKE) -C t

.PHONY: clean default install test
