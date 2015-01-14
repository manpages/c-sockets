module BlockingEchoServer
  ( start ) where

import Data.Bits
import Data.List
import Network.Socket
import Network.BSD
import System.IO
import Control.Concurrent

getAddrInfoDo port = 
  getAddrInfo (Just (defaultHints {addrFlags = [AI_PASSIVE]})) Nothing (Just port)

socketDo serverAddr =
  socket (addrFamily serverAddr) Stream defaultProtocol >>= \s ->
  setSocketOption s ReuseAddr 1 >>
  return s

start port = withSocketsDo $ 
  getAddrInfoDo port                       >>= \(serverAddr:_)            ->
  socketDo serverAddr                      >>= \s                         ->
  bindSocket s (addrAddress serverAddr)    >>
  listen s 2                               >>
  acceptLoop s
  where
    acceptLoop s =
      accept s                                    >>= \(connS, clientAddr)   ->
      socketToHandle connS ReadMode               >>= \connHandle            ->
      hSetBuffering connHandle LineBuffering      >>
      hGetContents connHandle                     >>= \got ->
      putStr got                                  >>
      hClose connHandle                           >>
      acceptLoop s
