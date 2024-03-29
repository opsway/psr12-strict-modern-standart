# OpsWay PSR-12 strict coding standard

The coding standard ruleset for strong code style checking.

This specification extends and expands [PSR-12](https://github.com/php-fig/fig-standards/blob/master/proposed/extended-coding-style-guide.md), 
the extended coding style guide and requires adherence to [PSR-1](https://www.php-fig.org/psr/psr-1), 
the basic coding standard. All additional checks and sniffs use from another third-party libraries:

- slevomat/coding-standard
- webimpress/coding-standard

## Installation

1. Install the module via composer by running:

   ```bash
   composer require --dev opsway/psr12-strict-coding-standard
   ```

2. Add composer scripts into your `composer.json`:

   ```json
   "scripts": {
     "cs-check": "phpcs",
     "cs-fix": "phpcbf"
   }
   ```

3. Run the `init_phpcs.sh` to generate the PHP_CodeSniffer ruleset into your project root:

   ```bash
   wget https://raw.githubusercontent.com/opsway/psr12-strict-modern-standart/master/init_phpcs.sh
   chmod +x ./init_phpcs.sh
   ./init_phpcs.sh
   ```

   or, create a ruleset `phpcs.xml` in the project root with the following content (notice entries under `<!-- Paths to check -->`):

   ```xml
   <?xml version="1.0"?>
   <ruleset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:noNamespaceSchemaLocation="vendor/squizlabs/php_codesniffer/phpcs.xsd">
   
       <arg name="basepath" value="."/>
       <arg name="cache" value=".phpcs-cache"/>
       <arg name="colors"/>
       <arg name="extensions" value="php"/>
       <arg name="parallel" value="10"/>
       
       <!-- Show progress -->
       <arg value="p"/>
   
       <!-- Paths to check -->
       <file>config</file>
       <file>src</file>
       <file>test</file>
   
       <!-- Include all rules from the Zend Coding Standard -->
       <rule ref="OpsWayStrictPSR12CodingStandard"/>
   </ruleset>
   ```

You can include or exclude relevant directories within `file` elements under `<!-- Paths to check -->` in the PHP_CodeSniffer ruleset above.
For further reference, please see the PHP_CodeSniffer wiki: https://github.com/squizlabs/PHP_CodeSniffer/wiki/Annotated-ruleset.xml

## Usage

* To run checks only:

  ```bash
  $ composer cs-check
  ```

* To automatically fix many CS issues:

  ```bash
  $ composer cs-fix
  ```

## Reference

Rules can be added, excluded or tweaked locally, depending on your preferences. More information on how to do this can
be found here:

- [Coding Standard Tutorial](https://github.com/squizlabs/PHP_CodeSniffer/wiki/Coding-Standard-Tutorial)
- [Configuration Options](https://github.com/squizlabs/PHP_CodeSniffer/wiki/Configuration-Options)
- [Selectively Applying Rules](https://github.com/squizlabs/PHP_CodeSniffer/wiki/Annotated-Ruleset#selectively-applying-rules)
- [Customisable Sniff Properties](https://github.com/squizlabs/PHP_CodeSniffer/wiki/Customisable-Sniff-Properties)
