# PHP7Compatibility

[![Build Status](https://travis-ci.org/vfalies/php7compatibility.svg?branch=master)](https://travis-ci.org/vfalies/php7compatibility)

This container propose to check the compatibility of your code with PHP 7.x

## Usage

```
docker run --rm -v $(pwd):/app vfac/php7compatibility <version> <option> <path>
```

### version

PHP Version used to check code compatibility: 7.0, 7.1, 7.2, 7.3, 7.4

For instance to check code of the current directory in PHP version 7.4 :

```
docker run --rm -v $(pwd):/app vfac/php7compatibility 7.4 .
```

### option

#### memory_limit

With large source code, you could have an error message like:

```
PHP Fatal error:  Allowed memory size of 134217728 bytes exhausted (tried to allocate 20480 bytes) in /php7checker/vendor/squizlabs/php_codesniffer/src/Tokenizers/Tokenizer.php on line 1282
```

To prevent this error type, you can use the following option

```
-d memory_limit=512M
```

This option set temporary the memory limit php option to 512M

With a setting to 1Giga of memory:

```
docker run --rm -v $(pwd):/app vfac/php7compatibility 7.4 -d memory_limit=1G .
```

#### File extensions

You can limit the inspection of your code to specific extension file with the optiion

```
--extensions=php
```

Several extensions can be add, with a comma separation

```
--extensions=php,lib
```

Example

```
docker run --rm -v $(pwd):/app vfac/php7compatibility 7.4 --extensions=php .
```

#### Ignoring files and folders

The `--ignore` option can be useful to prevent a big scan of your code.

```
--ignore=vendor
```

Several paths can be add, with a comma separation

```
--ignore=vendor,tmp
```

Exemple

```
docker run --rm -v $(pwd):/app vfac/php7compatibility 7.4 --ignore=vendor .
```

### path

Path to inspect into current directory. To inspect all files in current directory use `.`

```
docker run --rm -v $(pwd):/app vfac/php7compatibility 7.4 .
```
