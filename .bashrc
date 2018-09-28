function rand512() {
	dd count=1024 < /dev/urandom 2> /dev/null | shasum -a 512 | cut -d ' ' -f 1
}

function rand256() {
	dd count=1024 < /dev/urandom 2> /dev/null | shasum -a 256 | cut -d ' ' -f 1
}

function rand160() {
	dd count=1024 < /dev/urandom 2> /dev/null | shasum -a 1 | cut -d ' ' -f 1
}

function rand128() {
	rand256 | cut -c1-32
}

function rand64() {
	rand256 | cut -c1-16
}

function rand32() {
	rand256 | cut -c1-8
}
