module EchoOnceServer
  ( start ) where

import Data.Bits
import Network.Socket
import Network.BSD
import Data.List
import System.IO

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
  accept s                                 >>= \(connS, clientAddr)       ->
  socketToHandle connS ReadMode            >>= \connHandle                ->
  hSetBuffering connHandle NoBuffering     >>
  hGetLine connHandle                      >>= \line                      ->
  hClose connHandle                        >>
  putStrLn line                            >>
  sClose s
