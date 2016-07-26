# haskell-web-bootstrap

![Bootstrap logo](/assets/logo.jpg?raw=true "Bootstrap logo")

Bootstrap(3) classes and utilities for Haskell. This library is a direct port of purescript's purescript-halogen-bootsrap.

## Example

An example code snippet mixing Web.Bootstrap (B.) with React Flux (react-flux).

```haskell
import qualified Web.Bootstrap3 as B

viewIndex :: Store -> HTMLView_
viewIndex Store{..} = do
  Loading.loader1 _organizations $ \organizations -> do
    cldiv_ B.containerFluid $ do
      h1_ "Organizations"
      ahref $ routeWith' $ Organizations New
      PageNumbers.view_ (_pageInfo, routeWith' $ Organizations Index)
      ul_ [className_ B.listUnstyled] $ do
        mapM_ (\OrganizationPackResponse{..} -> do
          let OrganizationResponse{..} = organizationPackResponseOrganization
          li_ $ do
            cldiv_ B.row $ do
              cldiv_ B.colXs1 $ p_ $ Gravatar.viewUser_ XSmall organizationPackResponseUser
              cldiv_ B.colXs3 $ p_ $ ahrefName organizationResponseDisplayName (routeWith' $ Organizations (ShowS organizationResponseName))
              cldiv_ B.colXs6 $ p_ $ elemText $ maybe "No Description." id organizationResponseDescription
              cldiv_ B.colXs2 $ p_ $ elemText $ prettyUTCTimeMaybe organizationResponseCreatedAt
          ) organizations
```

## Contributions

Pull requests welcome!
