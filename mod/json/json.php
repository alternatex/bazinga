<?php namespace bazinga;

// include helpers - pretty json formatting helper (borrowed from: http://recursive-design.com/blog/2008/03/11/format-json-with-php/)
function formatJSON($json) {

    $result      = '';
    $pos         = 0;
    $strLen      = strlen($json);
    $indentStr   = '  ';
    $newLine     = "\n";
    $prevChar    = '';
    $outOfQuotes = true;

    for ($i=0; $i<=$strLen; $i++) {

        // Grab the next character in the string.
        $char = substr($json, $i, 1);

        // Are we inside a quoted string?
        if ($char == '"' && $prevChar != '\\') {
            $outOfQuotes = !$outOfQuotes;
        
        // If this character is the end of an element, 
        // output a new line and indent the next line.
        } else if(($char == '}' || $char == ']') && $outOfQuotes) {
            $result .= $newLine;
            $pos --;
            for ($j=0; $j<$pos; $j++) {
                $result .= $indentStr;
            }
        }
        
        // Add the character to the result string.
        $result .= $char;

        // If the last character was the beginning of an element, 
        // output a new line and indent the next line.
        if (($char == ',' || $char == '{' || $char == '[') && $outOfQuotes) {
            $result .= $newLine;
            if ($char == '{' || $char == '[') {
                $pos ++;
            }
            
            for ($j = 0; $j < $pos; $j++) {
                $result .= $indentStr;
            }
        }
        
        $prevChar = $char;
    }

    return $result;
}

// namespace
$prefix = $_SERVER['argv'][1];

// conversion target
$output = $_SERVER['argv'][2];

// variables collection
$settings = array();

// inject hint - «scaffolder» @ work
$settings['FILE_CONTENTS_AUTOMATICALLY_GENERATED_BY_BAZINGA'] = 'DO *NOT* EDIT THIS FILE DIRECTLY';

// iterate environment variables collect by namespace
foreach($_SERVER as $key => $value){ 
    $prefixc=strlen($prefix);
    if(($substr=substr($key, 0, $prefixc))==$prefix) {     
        $settings[substr($key, $prefixc)] = $value;
    }
}

// bogus
echo "\nConverting environment variables with namespace: $prefix to JSON $output ...";

// write to disk
file_put_contents($output, formatJson(json_encode($settings)));

// go home
echo " done.\n\n";

// debug
echo file_get_contents($output)."\n\n";
