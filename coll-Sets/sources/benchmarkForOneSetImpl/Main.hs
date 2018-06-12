{-# OPTIONS_GHC -O0 #-}

module Main where


import Criterion.Main

--import Criterion.Main.Options

import Criterion.Types (
    Config ( .. )
    )


--import qualified Data.Edison.Coll.UnbalancedSet as S

--import qualified Data.Edison.Coll.StandardSet as S

import qualified Data.Edison.Coll.UnbalancedSet as S


-- ---------- ---------- ---------- ---------- ---------- ---------- ----------

import BenchmarksConfig

import Defs

import Ops

import Environments


-- ---------- ---------- ---------- ---------- ---------- ---------- ----------

{-
{-# LANGUAGE DeriveGeneric #-}

import GHC.Generics (Generic)
-}

--import Control.DeepSeq

--instance NFData a => NFData ( S.Set a )


-- ---------- ---------- ---------- ---------- ---------- ---------- ----------

-- Benchmarks

main =
    defaultMainWith myBenchmarkConfig [

        bgroup ( "Set/" ++ S.moduleName ) [

            env addEnvSetup $ \ ~s -> bench addOpDesc $ nf ( addNDistinctFrom s addFromNElems ) 0

            , env addAllEnvSetup $ \ ~( s , t ) -> bench addAllOpDesc $ nf ( addAllNTimes s t ) addAllNRepeats
                
            -- clear
            , env clearEnvSetup $ \ ~s -> bench clearOpDesc $ nf clear s

            , env containsEnvSetup $ \ ~s -> bench containsOpDesc $ nf ( containsNTimes s containsElement ) containsNRepeats

            , env containsAllEnvSetup $ \ ~( s , t ) -> bench containsAllOpDesc $ nf ( containsAllNTimes s t ) containsAllNRepeats

            -- iterator
            , env iteratorEnvSetup $ \ ~s -> bench iteratorOpDesc $ nf iterator s

            , env removeEnvSetup $ \ ~s -> bench removeOpDesc $ nf ( removeNTimes s ) removeNRepeats

            , env removeAllEnvSetup $ \ ~( s , t ) -> bench removeAllOpDesc $ nf ( removeAllNTimes s t ) removeAllNRepeats

            , env retainAllEnvSetup $ \ ~( s , t ) -> bench retainAllOpDesc $ nf ( retainAllNTimes s t ) retainAllNRepeats

            , env toListEnvSetup $ \ ~s -> bench toListOpDesc $ nf ( toListNTimes s ) toListNRepeats
        ]
    ]


-- ---------- ---------- ---------- ---------- ---------- ---------- ----------


