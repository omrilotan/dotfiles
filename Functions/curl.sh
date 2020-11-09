# See https://ec.haxx.se/usingcurl/usingcurl-verbose/usingcurl-writeout#available-write-out-variables
function measure {
	local tmpl="Response: %{http_code} (%{content_type})

Times:
Name lookup:    %{time_namelookup} s
Connect:        %{time_connect} s
App Connect:    %{time_appconnect} s
Pre-Transfer:   %{time_pretransfer} s
Redirect:       %{time_redirect} s
Start Transfer: %{time_starttransfer} s
Total:          %{time_total} s

Size:           %{size_download} b
Download Speed: %{speed_download} bps
"
	curl -w "${tmpl}" -o /dev/null -s $1
}
