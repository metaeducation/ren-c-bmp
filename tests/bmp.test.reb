; %bmp.test.reb

(image? decode 'bmp read %../fixtures/rebol-logo.bmp)

; The results of decoding lossless encodings should be identical.
(
    bmp-img: decode 'bmp read %../fixtures/rebol-logo.bmp
    gif-img: decode 'gif read %../fixtures/rebol-logo.gif
    png-img: decode 'png read %../fixtures/rebol-logo.png
    all [
        bmp-img = gif-img
        bmp-img = png-img
    ]
)

; Because there is more metadata in a PNG file than just the encoding, and
; compression choices may be different, you won't necessarily get the same
; bytes out when you re-encode a PNG.  It should be deterministic, though.
(
    png-img: decode 'png read %../fixtures/rebol-logo.png
    bmp-img: decode 'bmp read %../fixtures/rebol-logo.bmp

    png-bytes-png: encode 'png png-img
    png-bytes-bmp: encode 'png bmp-img

    all [
        png-bytes-png = png-bytes-bmp
        (decode 'png png-bytes-png) = (decode 'png png-bytes-bmp)
    ]
)
