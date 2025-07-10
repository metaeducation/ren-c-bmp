Rebol [
    title: "BMP Codec Extension"
    name: BMP
    type: module
    version: 1.0.0
    license: "Apache 2.0"
]

sys.util/register-codec 'bmp %.bmp
    identify-bmp?/
    decode-bmp/
    encode-bmp/
