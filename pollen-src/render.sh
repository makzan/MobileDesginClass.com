find ./ -type d -print0 | xargs -0 -iD cp directory-require.rkt D

raco pollen render index.ptree

mkdir ../build-tmp/

cp -r ./* ../build-tmp/


rm ../build-tmp/**/*.pm
rm ../build-tmp/**/*.rkt
rm ../build-tmp/*.pm
rm ../build-tmp/directory-require.rkt
rm ../build-tmp/index.ptree
rm ../build-tmp/render.sh
rm ../build-tmp/pollen.cache
rm ./**/*.html
rm ./*.html

mv ../build-tmp/template.html ./

rsync -r ../build-tmp/ ../

rm -rf ../build-tmp