module Hello where

import Clash.Prelude
import Clash.Annotations.TH

topEntity
    :: "CLK" ::: Clock System
    -> "INP" ::: Signal System Bit
    -> "OUT" ::: Signal System Bit
topEntity clk = withClock clk $ fmap complement

makeTopEntity 'topEntity
