#!/bin/bash

source keys

(cd decrypted ; find . -type d) | while read d
do
	mkdir -p encrypted/$d
done

(cd decrypted ; find . -type f) | while read f
do
	openssl aes-256-cbc -K $key -iv $iv -e < decrypted/$f > encrypted/$f
done
