module MyLib (mainBoard) where

import Clash.Prelude
import Control.Monad.Reader

mainBoard :: Signal System Bit -> Signal System Bit
mainBoard = fmap $ asks complement
