#!/bin/bash

# Reset
Color_Off='\e[0m'      

# Regular Colors
Black='\e[0;30m'; Red='\e[0;31m'; Green='\e[0;32m'; Yellow='\e[0;33m'; Blue='\e[0;34m'; Purple='\e[0;35m'; Cyan='\e[0;36m'; White='\e[0;37m';        

# Bold
BBlack='\e[1;30m'; BRed='\e[1;31m'; BGreen='\e[1;32m'; BYellow='\e[1;33m'; BBlue='\e[1;34m'; BPurple='\e[1;35m'; BCyan='\e[1;36m'; BWhite='\e[1;37m';       

function title {
	txtstr
	echo "
-----------------------------------------
« $1 » 
-----------------------------------------"
	txtrst		
}

function txtstr {
	printf "$BBlue"
}

function txtrst {
	printf "$Color_Off"
}

function txt {
	txtstr
	echo "
-----------------------------------------
« $1 »
-----------------------------------------"
	txtrst
}

txtstr

printf $BRed

echo "-----------------------------------------------------------------------------"
echo "
		   + + + + + + Bazinga! v.1.0.0 + + + + + +
"
echo "-----------------------------------------------------------------------------"

cat <<message

                         
      *                                             do it once (but right)           
    **                              *                             
    **                             ***                - { 1 : 4 : ∞ } -                                 
    **                              *                                        
    **                    ******                                             
    ** ****     ****     ******** ***   ***  ****     ****      ****         
    *** ***  * * ***  * *      **  ***   **** **** * *  ***  * * ***  *      
    **   **** *   ****         *    **    **   **** *    **** *   ****       
    **    ** **    **         *     **    **    ** **     ** **    **       
    **    ** **    **        ***    **    **    ** **     ** **    **       
    **    ** **    **         ***   **    **    ** **     ** **    **       
    **    ** **    **          ***  **    **    ** **     ** **    **       
    **    ** **    **           **  **    **    ** **     ** **    **       
     *****    ***** **          **  *** * ***   *** ********  ***** **     
      ***      ***   **         *    ***   ***   ***  *** ***  ***   **     
                               *                           ***              
                             *                      ****   ***             
                             *                     *******  **              
                                                  *     ****        


message

echo "-----------------------------------------------------------------------------"

txtrst

title "script globals"

# environment variables
if [[ -z $bazenv ]]; then		
	bazenv="BAZINGA"
fi

# internals
if [[ -z $bazinga_directory ]]; then		
	bazinga_directory=".bazinga"
fi

if [[ -z $bazinga_protect ]]; then		
	bazinga_protect=".htaccess"
fi

if [[ -z $bazinga_configure ]]; then		
	bazinga_configure="configure.sh"
fi

if [[ -z $bazinga_namespace ]]; then		
	bazinga_namespace="bazinga_"
fi

if [[ -z $bazinga_custom ]]; then		
	bazinga_custom=".bazinga/settings.sh"
fi

if [[ -z $bazinga_custom_json ]]; then		
	bazinga_custom_json="settings.json"
fi

txtrst

printf "
${BBluexx}\e[33m☠ ☠ ☠ global namespace pollution  ☠ ☠ ☠ 

\e[32mprefix\e[0m 
${bazinga_namespace}

\e[32mvariables\e[0m 
current, custom, name, save

\e[32mfunctions\e[0m 
init, new, readline, flush

${BBluexx}\e[33m☠ ☠ ☠ global namespace pollution  ☠ ☠ ☠ 
"

# setup helpers
function bazinga_init {

	if [ ! -d $bazinga_directory ]; then	
		txtstr
		echo "
-----------------------------------------
« bazinga? nope! let's build grounds 4 » 
-----------------------------------------
"
		# initialize
		mkdir $bazinga_directory && cd $bazinga_directory
		
		# cwd out
		echo "cwd: $(pwd)"
		
		# protect directory (TODO: nginx and friends?!)
		echo '# pssst!' > $bazinga_protect
		echo 'deny from all' >> $bazinga_protect

		# write header
		echo '#!/usr/bin/env bash' > $bazinga_configure
		echo '' >> $bazinga_configure
		echo 'bazeninga="BAZINGA"' >> $bzinga_configure
		echo "bazinga_directory=\"${bazinga_directory}\"" >> $bazinga_configure
		echo "bazinga_protect=\"${bazinga_protect}\"" >> $bazinga_configure
		echo "bazinga_configure=\"${bazinga_configure}\"" >> $bazinga_configure
		echo "bazinga_namespace=\"${bazinga_namespace}\"" >> $bazinga_configure		
		echo "bazinga_custom=\"${bazinga_custom}\"" >> $bazinga_configure	
		echo "bazinga_custom_json=\"${bazinga_custom_json}\"" >> $bazinga_configure	
		echo '' >> $bazinga_configure
		echo "function bazinga_gather(){" >> $bazinga_configure	
		echo "	bazinga_input \"github_repository\" \"github_repository\"" >> $bazinga_configure					
		echo "	bazinga_input \"github_user_name\" \"github_user_name\"" >> $bazinga_configure	
		echo "	bazinga_input \"github_user_pass\" \"github_user_pass\"" >> $bazinga_configure	
		echo "	bazinga_input \"github_user_email\" \"github_user_email\"" >> $bazinga_configure			
		echo "}" >> $bazinga_configure	
		echo '' >> $bazinga_configure
		echo "function bazinga_postprocess(){" >> $bazinga_configure	
		echo "echo \"machine github.com\" >> ~/.netrc" >> $bazinga_configure
		echo "echo \"login \${github_user_name}\" >> ~/.netrc" >> $bazinga_configure
		echo "echo \"password \${github_user_pass}\" >> ~/.netrc" >> $bazinga_configure
		echo "}" >> $bazinga_configure	

		# make executable
		chmod a+x $bazinga_configure

		# go home
		cd -

		# create new projects // debug bogus (yet)
		select result in Yes No Cancel
		do
			echo $result
			break;
		done		
	fi

	# customize output
	if [[ -z $bazinga_custom ]]; then		
		bazinga_custom="custom.sh"
	fi

	# save execution
	bazinga_namespace="$1"
	bazinga_save="${bazinga_custom}"
	bazinga_custom="${bazinga_custom}.tmp"

	# speak out loud
	title "script configuration"
	echo ""
	echo "directory: 	$bazinga_directory"
	echo "current: 	$(pwd)"
	echo "custom: 	$bazinga_save"
	echo "temporary: 	$bazinga_custom"

	# run current (set default values -> see loop)
	if [ -f $bazinga_save ]; then	

		title "current configuration"
		echo ""

		cat $bazinga_save
		source $bazinga_save
	fi

	# remove current
	rm -rf $bazinga_custom

	# write header
	echo '#!/usr/bin/env bash' > $bazinga_custom
	echo '' >> $bazinga_custom

	# make executable
	chmod a+x $bazinga_custom

	# ready for change
	title "setup new configuration"
	echo ""

}

# passthrough w/namespace
function bazinga_input { 

	# request info
	bazinga_readline $1 "${bazinga_namespace}${2}"

}

# gather single input value & append to output
function bazinga_readline {

	# init
	unset bazinga_name
	unset bazinga_current

	# previous value?
	if [[ ! -z ${!2} ]]; then
		bazinga_current=" (${!2})"		
	fi	

    # request input
	echo "Enter ${1}:${bazinga_current}"

	# gather input
	read -e bazinga_name || exit

	# use current value if none provided
	if [[ -z $bazinga_name ]]; then
		bazinga_name="${!2}";
	fi
  
  	# write output
  	echo "export ${2}=\"${bazinga_name}\";" >> "$bazinga_custom"

}

# write configuration to disk and activate
function bazinga_flush {

	# let the hamsters dance... *
	title "review new configuration"
	echo ""

	cat $bazinga_custom

	title "confirm new configuration"

	printf "
Press \e[33mEnter\e[00m to write changes to disk or \e[33m^C\e[00m to abort
"
	printf "
Destination: \e[32m$(pwd)/$bazinga_save\e[00m"
	
	# write to disk
	read -e xxx || exit

	title "saving new configuration"
	echo ""
	echo "Writing changes to disk..."

	# replace configuration
	mv $bazinga_custom $bazinga_save

	# re-store assignment
	bazinga_custom=$bazinga_save

	# cleanup
	unset bazinga_name
	unset bazinga_current	
	unset bazinga_save

	# in beauty we ...
	title "loading new configuration"	
	source $bazinga_custom

}