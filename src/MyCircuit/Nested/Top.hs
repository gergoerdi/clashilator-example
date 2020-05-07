module MyCircuit.Nested.Top where

import Clash.Prelude
import Clash.Annotations.TH
import MyCircuit.Nested.Lib

topEntity
    :: "CLK" ::: Clock System
    -> "INP" ::: Signal System Bit
    -> "OUT" ::: Signal System Bit
topEntity clk = withClock clk mainBoard

makeTopEntity 'topEntity
