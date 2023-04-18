# strncpy

```ca65

;----------------------------------------------------------------------
; strncpy src, dest, n
;
; Sortie:
;        A: 0 et Z=1 si copie effectuée, inchangé si non
;        X: 0
;        Y: Longueur réellement copiée
;----------------------------------------------------------------------
```

```ca65

    lda     #<file_path
    sta     ptr2
    lda     #>file_path
    sta     ptr2+1

    strncpy ptr2, ptr1, #20 ;Limit 20 bytes (immediate mode) strncpy(src, dest, n)
```
