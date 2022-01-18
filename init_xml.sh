#!/bin/bash

# Navigate to your PHP project root

# Remove old phpcs.xml and create new one
rm -f phpcs.old
mv phpcs.xml phpcs.old

# Initialize the phpcs.xml file

cat > phpcs.xml <<EOF 
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
EOF

# For each directory or symlink in curr dir only, place its relative path in <file></file> tags appended to ./phpcs.xml
find . -maxdepth 1 -type d -or -type l | while read dir; do
    dir=${dir#./}
    # dirs starting with a dot are hidden, so skip them
    if ! [[ $dir =~ ^\. ]];
    then
        echo "    <file>$dir</file>" >> phpcs.xml
    fi
done

cat << EOF >> phpcs.xml

    <!-- Include all rules from the Zend Coding Standard -->
    <rule ref="OpsWayStrictPSR12CodingStandard"/>
</ruleset>
EOF