# Changelog

## [0.4.0](https://github.com/jolars/ProjectRoot.jl/compare/v0.3.1...v0.4.0) (2024-02-28)


### ⚠ BREAKING CHANGES

* return pwd() or __source__.file dir if we reach file system root
* use recursive search logic when in REPL (interactive)

### Features

* return pwd() or __source__.file dir if we reach file system root ([b559f8a](https://github.com/jolars/ProjectRoot.jl/commit/b559f8a60187e08dd8841579acf4e674fc7208e7))
* support expressions in `[@projectroot](https://github.com/projectroot)` ([b8e302e](https://github.com/jolars/ProjectRoot.jl/commit/b8e302efaefb63a3634dac21e674eb253d2ed05d))
* support string interpolation ([8a48c81](https://github.com/jolars/ProjectRoot.jl/commit/8a48c81200cc5444199d58255e0e12ca0f6227fb))
* use recursive search logic when in REPL (interactive) ([415c517](https://github.com/jolars/ProjectRoot.jl/commit/415c517b4a96b9c85240eb4919ca1988cf536785))

## [0.3.1](https://github.com/jolars/ProjectRoot.jl/compare/v0.3.0...v0.3.1) (2024-01-31)


### Bug Fixes

* correctly construct path when in REPL ([10cf4e8](https://github.com/jolars/ProjectRoot.jl/commit/10cf4e8374261cf79381e49ea59be5b0f6e4c3c1))

## [0.3.0](https://github.com/jolars/ProjectRoot.jl/compare/v0.2.0...v0.3.0) (2024-01-23)

### ⚠ BREAKING CHANGES

- use `.projectroot` file instead of .here
- change `@here` to `@projectroot`

### Features

- change [@here](https://github.com/here) to [@projectroot](https://github.com/projectroot) ([163b632](https://github.com/jolars/ProjectRoot.jl/commit/163b632868edcefb8439883cacf9d20cd9cd522e))
- use .projectroot file instead of .here ([d07aa8a](https://github.com/jolars/ProjectRoot.jl/commit/d07aa8ac39834e2e42de6b9f5068f198fa3618bb))

### Bug Fixes

- **tests:** here -> project_root ([3f08cc8](https://github.com/jolars/ProjectRoot.jl/commit/3f08cc85da9f5bdee6fe702d76b4f8388ac3545f))

## [0.2.0](https://github.com/jolars/ProjectRoot.jl/compare/v0.1.0...v0.2.0) (2024-01-22)

### ⚠ BREAKING CHANGES

- change name to ProjectRoot

### Features

- change name to ProjectRoot ([39607e4](https://github.com/jolars/ProjectRoot.jl/commit/39607e428af54ba1b7b653a08e42b99b1b21a8ba))

## [0.1.0](https://github.com/jolars/ProjectRoot.jl/compare/v0.0.1...v0.1.0) (2024-01-22)

### ⚠ BREAKING CHANGES

- require julia 1.6

### Features

- add here() and iam() functions ([23761d6](https://github.com/jolars/ProjectRoot.jl/commit/23761d66e00d0cc0f38567762daebf04c83a74fd))

### Bug Fixes

- always return at least file system root ([d8c486c](https://github.com/jolars/ProjectRoot.jl/commit/d8c486c5355402d422a9ca071f157bda4d9b1125))
- remove erroneous code artifcats ([3b55b6f](https://github.com/jolars/ProjectRoot.jl/commit/3b55b6f16051cb261eb3cd7f5d72ab07b711df7f))
- use a macro instead ([7567456](https://github.com/jolars/ProjectRoot.jl/commit/756745663ffa237a86009d3149d8925dd62916cd))

### Build System

- require julia 1.6 ([7e634b8](https://github.com/jolars/ProjectRoot.jl/commit/7e634b867310b1142917fb84c2c9ea68f4d6b034))
