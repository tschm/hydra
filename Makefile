.DEFAULT_GOAL := help


.PHONY: help
help:  ## Display this help screen
	@echo -e "\033[1mAvailable commands:\033[0m"
	@grep -E '^[a-z.A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2}' | sort


.PHONY: compile
compile: install ## Compile both documents
	@tectonic Hydra.tex
	@tectonic Fourier.tex


.PHONY: clean
clean: ## clean the folder
	@git clean -d -X -f


.PHONY: install
install: ## install tectonic
	@curl --proto '=https' --tlsv1.2 -fsSL https://drop-sh.fullyjustified.net |sh

.PHONY: fmt
fmt:
	@pre-commit run --all-files

