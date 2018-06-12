{-# OPTIONS_GHC -O0 #-}

module Main where


import Criterion.Main

--import Criterion.Main.Options

import Criterion.Types (
    Config ( .. )
    )

--import qualified Data.Edison.Assoc.AssocList as A

--import qualified Data.Edison.Assoc.StandardMap as A

import qualified Data.Edison.Assoc.StandardMap as A


-- ---------- ---------- ---------- ---------- ---------- ---------- ----------

import BenchmarksConfig

import Defs

import Ops

import Environments


-- ---------- ---------- ---------- ---------- ---------- ---------- ----------

--import Control.DeepSeq

--instance NFData a => NFData (S.Seq a)


-- ---------- ---------- ---------- ---------- ---------- ---------- ----------

-- Benchmarks

main =
    defaultMainWith myBenchmarkConfig [

        bgroup ( "AssocCollection/" ++ A.moduleName ) [

            env addEnvSetup $ \ ~a -> bench addOpDesc $ nf ( addNDistinctFrom a addFromNElems ) 0

            , env addAllEnvSetup $ \ ~( a , b ) -> bench addAllOpDesc $ nf ( addAllNTimes a b ) addAllNRepeats

            , env clearEnvSetup $ \ ~a -> bench clearOpDesc $ nf clear a

            , env containsEnvSetup $ \ ~a -> bench containsOpDesc $ nf ( containsNTimes a containsElement ) containsNRepeats

            , env containsAllEnvSetup $ \ ~( a , b ) -> bench containsAllOpDesc $ nf ( containsAllNTimes a b ) containsAllNRepeats

            , env iteratorEnvSetup $ \ ~a -> bench iteratorOpDesc $ nf iterator a

            , env removeEnvSetup $ \ ~a -> bench removeOpDesc $ nf ( removeNTimes a ) removeNRepeats

            , env removeAllEnvSetup $ \ ~( a , b ) -> bench removeAllOpDesc $ nf ( removeAllNTimes a b ) removeAllNRepeats

            , env retainAllEnvSetup $ \ ~( a , b ) -> bench retainAllOpDesc $ nf ( retainAllNTimes a b ) retainAllNRepeats

            , env toListEnvSetup $ \ ~a -> bench toListOpDesc $ nf ( toListNTimes a ) toListNRepeats
        ]
    ]


-- ---------- ---------- ---------- ---------- ---------- ---------- ----------


