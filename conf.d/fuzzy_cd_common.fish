function fcd_shortest_common
	set -l root $argv[1]
	set -l results $argv[1]
	set -e argv[1]
	for path in (fcd_return_array $argv | sort)
		if not test (string match "$root*" $path)
			set root $path
			set -a results $path
		end
	end
	fcd_return_array $results
end

function fcd_dir_to_regex
	echo (printf '%s' (echo "$argv"|sed -E 's/ +//g'|sed -E 's/(.)/\1[^\/]*/g'))
end

function fcd_dir_regex
	set -l section
	set -l regex (fcd_dir_to_regex $argv[1])
	for arg in $argv[2..-1]
		set section (fcd_dir_to_regex $arg)
		set regex "$regex/[^.]*$section"
	end
	echo $regex
end

function fcd_return_array -d 'Echo out an array one line at a time'
	for item in $argv
		echo $item
	end
end
