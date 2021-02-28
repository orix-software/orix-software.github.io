cd kernel && mkdocs build && cp site/* . -adpR && cd ..

mkdocs build && cp site/* . -adpR  && git add * && git commit -m update && git push
