# Package

version       = "0.1.0"
author        = "SolitudeSF"
description   = "Image differentiation tool and library"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["diffimg"]


# Dependencies

requires "nim >= 0.20.0", "imageman >= 0.4.0", "cligen >= 0.9.31"
