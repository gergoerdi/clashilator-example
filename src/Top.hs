module Top where

import Clash.Prelude
import Clash.Annotations.TH
import MyLib

topEntity
    :: "CLK" ::: Clock System
    -> "INP" ::: Signal System Bit
    -> "OUT" ::: Signal System Bit
topEntity clk = withClock clk mainBoard

makeTopEntity 'topEntity
