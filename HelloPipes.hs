
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE KindSignatures #-}

import Pipes
import Pipes.HTTP
import qualified Pipes.ByteString as PB  -- from `pipes-bytestring`


-- FIXME better name
runEffectResp :: forall (m :: * -> *).
                   MonadIO m =>
                   Response (Pipes.Proxy X () () PB.ByteString m ()) -> m ()
runEffectResp resp =
            runEffect $ responseBody resp >-> PB.stdout
    
-- FIXME much better name
withMumble :: Request -> Manager -> IO ()
withMumble req m =
        withHTTP req m $ runEffectResp

main :: IO ()
main = do
    req <- parseUrl "http://www.example.com"
    withManager tlsManagerSettings $ withMumble req
