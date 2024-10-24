# Homebrew Tap

## Installation

Add the tap:

```sh
brew tap thegeeklab/tap
```

Install formula:

```sh
brew install <formula> # e.g. brew install git-sv
```

## Update formulas

```sh
# make sure you installed the formula first, then:
brew bump-formula-pr -v --strict --version <new version> git-sv
```
