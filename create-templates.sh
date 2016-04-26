#!/bin/bash

rm -r temp
mkdir temp
cd temp

printf "\ncreating base\n"
lein new re-frame base
cd base
lein with-profile prod cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..


printf "\ncreating base +routes\n"
lein new re-frame base-routes +routes
cd base-routes
lein with-profile prod cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..

printf "\ncreating base +re-com\n"
lein new re-frame base-recom +re-com
cd base-recom
lein with-profile prod cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..

printf "\ncreating base +test\n"
lein new re-frame base-test +test
cd base-test
lein with-profile prod cljsbuild once min
lein doo phantom test once
cd resources/public
google-chrome index.html
cd ../../..

printf "\ncreating base +garden\n"
lein new re-frame base-garden +garden
cd base-garden
lein garden once
lein with-profile prod cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..

printf "\ncreating base +less\n"
lein new re-frame base-less +less
cd base-less
lein less once
lein with-profile prod cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..


printf "\ncreating base +routes +re-com\n"
lein new re-frame base-routes-recom +routes +re-com
cd base-routes-recom
lein with-profile prod cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..


printf "\ncreating base +routes +re-com +test +garden +handler +less\n"
lein new re-frame everything +routes +re-com +test +garden +handler +less
cd everything
lein garden once
lein less once
lein with-profile prod cljsbuild once min
lein doo phantom test once
cd resources/public
google-chrome index.html
cd ../../..
