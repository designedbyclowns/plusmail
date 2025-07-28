# plusmail

A MacOS command line tool to generate a random email with [sub-addressing](https://en.wikipedia.org/wiki/Email_address#Sub-addressing).

## Usage

### Example

```
$ plusmail --email="foo@example.com"
foo+incitingly@example.com
```

See the help for additional options:

```
$ plusmail --help
```

## Installation

### With [`Mint`](https://github.com/yonaskolb/Mint)

```
$ mint install designedbyclowns/plusmail
```

### Manually

Clone the repo then:

```
$ make install
```

Or using swift itself:

```
$ swift build -c release
$ cp .build/release/plusmail /usr/local/bin/plusmail
```
