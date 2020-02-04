{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_wx_keisan (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/apo/doc/project/make/haskell/sandbox/wx_keisan/.cabal-sandbox/bin"
libdir     = "/home/apo/doc/project/make/haskell/sandbox/wx_keisan/.cabal-sandbox/lib/x86_64-linux-ghc-8.6.5/wx-keisan-0.1.0.0-FtK05dEVHa45uE1Uyxhazn-wx-keisan"
dynlibdir  = "/home/apo/doc/project/make/haskell/sandbox/wx_keisan/.cabal-sandbox/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/apo/doc/project/make/haskell/sandbox/wx_keisan/.cabal-sandbox/share/x86_64-linux-ghc-8.6.5/wx-keisan-0.1.0.0"
libexecdir = "/home/apo/doc/project/make/haskell/sandbox/wx_keisan/.cabal-sandbox/libexec/x86_64-linux-ghc-8.6.5/wx-keisan-0.1.0.0"
sysconfdir = "/home/apo/doc/project/make/haskell/sandbox/wx_keisan/.cabal-sandbox/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "wx_keisan_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "wx_keisan_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "wx_keisan_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "wx_keisan_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "wx_keisan_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "wx_keisan_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
