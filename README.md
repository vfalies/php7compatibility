# PHP7Compatibility

This container propose to check the compatibility of your code with PHP 7.x

## Usage

```
docker run --rm -v $(pwd):/app vfac/php7compatibility <version> <option> <path>
```

- <version>

PHP Version used to check code compatibility: 7.0, 7.1, 7.2

For instance to check code of the current directory in PHP version 7.1 :

```
docker run --rm -v $(pwd):/app vfac/php7compatibility 7.1 .
```

- <option>

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
docker run --rm -v $(pwd):/app php7compatibility 7.2 -d memory_limit=1G .
```