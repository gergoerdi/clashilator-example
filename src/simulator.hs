{-# LANGUAGE RecordWildCards #-}
import Clash.Prelude

import VerilatorFFI
import Foreign.Storable
import Foreign.Marshal.Alloc

main :: IO ()
main = do
    putStrLn "outside before"
    sim <- simInit

    alloca $ \inp -> alloca $ \outp -> do
        putStrLn "inside before"

        let step input = do
                poke inp input
                simStep sim inp outp
                output <- peek outp
                putStrLn $ unwords [show input, "->", show output]

        step INPUT{ iINP = low }
        step INPUT{ iINP = high }

        putStrLn "inside after"

    simShutdown sim
    putStrLn "outside after"
