#!/bin/sh

# duplicate the working directory
cp -r artbanners artbanners_temp
mv artbanners artbanners_renamed && mv artbanners_temp artbanners
cd artbanners

# strip .svn directories out
find . -type d -name .svn | xargs rm -rf

# package things up
cd chrome
zip -r artbanners.jar content skin
rm -rf content skin
cd ..
zip -r ../artbanners-build.xpi .

# revert & back out
cd ..
rm -rf artbanners
mv artbanners_renamed artbanners
exit 0