import diffimg
import unittest, os
import imageman/images

setCurrentDir getAppDir()

suite "tests":
  let
    img1 = loadImage[ColorRGBAU] "images/mario-circle-cs.png"
    img2 = loadImage[ColorRGBAU] "images/mario-circle-node.png"

  test "Difference ratio":
    check getDiffRatio(img1, img2) == 0.007319618135968298

  test "Diff image":
    check genDiffImage(img1, img2).data == loadImage[ColorRGBAU]("images/mario-diff.png").data
