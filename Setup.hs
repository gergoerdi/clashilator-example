import Clash.Clashilator.Setup (clashilate)

import Distribution.Simple
import Distribution.Simple.LocalBuildInfo
import Distribution.Simple.Setup
import Distribution.PackageDescription

main :: IO ()
main = defaultMainWithHooks simpleUserHooks
    { buildHook = myBuildHook
    }

myBuildHook :: PackageDescription -> LocalBuildInfo -> UserHooks -> BuildFlags -> IO ()
myBuildHook pkg localInfo userHooks buildFlags = do
    pkg' <- clashilate pkg localInfo buildFlags "Top"

    buildHook simpleUserHooks pkg' localInfo userHooks buildFlags
