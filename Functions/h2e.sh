function h2e {
	echo "$@" \
	 | sed 's/\//q/g' \
	 | sed 's/׳/w/g' \
	 | sed 's/ק/e/g' \
	 | sed 's/ר/r/g' \
	 | sed 's/א/t/g' \
	 | sed 's/ט/y/g' \
	 | sed 's/ו/u/g' \
	 | sed 's/ן/i/g' \
	 | sed 's/ם/o/g' \
	 | sed 's/פ/p/g' \
	 | sed 's/ש/a/g' \
	 | sed 's/ד/s/g' \
	 | sed 's/ג/d/g' \
	 | sed 's/כ/f/g' \
	 | sed 's/ע/g/g' \
	 | sed 's/י/h/g' \
	 | sed 's/ח/j/g' \
	 | sed 's/ל/k/g' \
	 | sed 's/ך/l/g' \
	 | sed 's/ף/;/g' \
	 | sed 's/ז/z/g' \
	 | sed 's/ס/x/g' \
	 | sed 's/ב/c/g' \
	 | sed 's/ה/v/g' \
	 | sed 's/נ/b/g' \
	 | sed 's/מ/n/g' \
	 | sed 's/צ/m/g' \
	 | sed 's/ת/,/g' \
	 | sed 's/ץ/./g'
}
