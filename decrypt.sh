#!/bin/bash

source keys

(cd encrypted ; find . -type d) | while read d
do
	mkdir -p decrypted/$d
done

(cd encrypted ; find . -type f) | while read f
do
	openssl aes-256-cbc -K $key -iv $iv -d < encrypted/$f > decrypted/$f
done
