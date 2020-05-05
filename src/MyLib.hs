module MyLib (mainBoard) where

import Clash.Prelude

mainBoard :: Signal System Bit -> Signal System Bit
mainBoard = fmap complement
