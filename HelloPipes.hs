
import Pipes
import Pipes.HTTP
import qualified Pipes.ByteString as PB  -- from `pipes-bytestring`

    
main :: IO ()
main = do
    req <- parseUrl "http://www.example.com"
    withManager tlsManagerSettings $ \m ->
        withHTTP req m $ \resp ->
            runEffect $ responseBody resp >-> PB.stdout
