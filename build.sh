rm -rf dist
mkdir -p dist
swfmill simple library.xml dist/empty.swf
mtasc -swf dist/empty.swf -out dist/Main.swf Main.as -version 8 -frame 1 -infer -keep -main 
cp index.html dist/index.html