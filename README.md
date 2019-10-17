# jlenv-update: Update jlenv and all installed plugins

[![Build Status](https://travis-ci.com/jlenv/jlenv-update.svg?branch=master)](https://travis-ci.com/jlenv/jlenv-update)[![Codacy Badge](https://api.codacy.com/project/badge/Grade/6620f1bf139c4bcdb35d6853bd7ef44c)](https://www.codacy.com/manual/taqtiqa-mark/jlenv-jlenv-update?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=jlenv/jlenv-update&amp;utm_campaign=Badge_Grade)[![CodeFactor](https://www.codefactor.io/repository/github/jlenv/jlenv-update/badge)](https://www.codefactor.io/repository/github/jlenv/jlenv-update)

This [jlenv](http://jlenv.github.io/jlenv) plugin adds the `jlenv update`
command that updates jlenv and all installed plugins.

## Installation

To install jlenv-update, clone this repository into your jlenv plugins
directory.

```bash
mkdir -p "$(jlenv root)/plugins"
git clone https://github.com/jlenv/jlenv-update.git "$(jlenv root)/plugins/jlenv-update"
```

## Usage

```bash
jlenv help update
```

## Version History

- 1.0.0
  - Initial public release for Julia.

## License

Released under the MIT license. See `LICENSE` for details.
