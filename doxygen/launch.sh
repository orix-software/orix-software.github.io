doxygen Doxyfile_vi
~/bin/doxybook2 --input doc/xml/ --output doxybook_output_vi --config config.json
for f in $(find  doxybook_output_vi/  | grep md)
do
    echo $f
    sed -i -e 's/cpp/ca65/g' "$f"
    sed -i -e 's/Functions Documentation/Routine documentation/g'  "$f"
    sed -i -e 's/function/Routine/g'  "$f"
    sed -i -e 's/Functions/Routine/g'  "$f"
    sed -i -e 's/()//g'  "$f"
    sed -i -e 's/\/mnt\/c\/Users\/plifp\/OneDrive\/oric\/projets\/orix-software\/vi\/src//g'  "$f"
    sed -i -e 's/\/Routines\/subfunc\/vi\///g'  "$f"

done

cp doxybook_output_vi/* ../docs/tools_docs/vi -adpR

