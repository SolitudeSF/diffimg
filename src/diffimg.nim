import imageman/[images, colors]

func absDiff[T: ColorComponent](a, b: T): T {.inline.} =
  if a > b:
    a - b
  else:
    b - a

func getDiffRatio*[T: Color](a, b: Image[T]): float =
  for p in 0..a.data.high:
    for c in 0..T.high:
      result += absDiff(a[p][c], b[p][c]).float
  result / (T.maxComponentValue.float * a.data.len.float * T.len.float)

func genDiffImage*[T: Color](a, b: Image[T]): Image[T] =
  result = initImage[T](a.w, a.h)
  for p in 0..result.data.high:
    for c in 0..T.high:
      result[p][c] = absDiff(a[p][c], b[p][c])

when isMainModule:
  import cligen

  proc diffimg(images: seq[string], output = ""): int =

    if images.len != 2:
      stderr.writeLine "Provide two images to diff"
      quit 1

    let
      img1 = loadImage[ColorRGBAU] images[0]
      img2 = loadImage[ColorRGBAU] images[1]

    if img1.w != img2.w or img1.h != img2.h:
      stderr.write "Images must have the same dimensions"
      quit 1

    if output.len > 0:
      genDiffImage(img1, img2).savePNG output
      stderr.write "Wrote diff image to ", output
    else:
      echo getDiffRatio(img1, img2)

  clCfg.version = "0.1.0"
  dispatch diffimg,
    help = {"output": "Save diff image to target filename in png format. If absent - output diff ratio."}
