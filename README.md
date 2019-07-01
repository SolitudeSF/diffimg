# diffimg

A Nim implementation of [diffimg](https://github.com/nicolashahn/diffimg).

Measures the per-pixel difference of two images with identical dimensions as a ratio, or
outputs a difference image showing where the two images differ. Currently supports `jpg`, `png`, `bmp` and `tga`

### Usage

To get a ratio:
```
diffimg image1 image2
```

To generate a diff image (in `png` format):
```
diffimg image1 image2 -o diff_image
```
