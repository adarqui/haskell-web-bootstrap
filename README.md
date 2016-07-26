# haskell-web-bootstrap

![Bootstrap logo](/assets/logo.jpg?raw=true "Bootstrap logo")

Bootstrap(3) classes and utilities for Haskell. This library is a direct port of purescript's purescript-halogen-bootsrap.

# example

An example code snippet mixing Web.Bootstrap (B.) with React Flux (react-flux).

```haskell
import qualified Web.Bootstrap3 as B

createTagsField
  :: Text
  -> [Text]
  -> Text
  -> (Text -> ViewEventHandler) -- ^ set current tag
  -> ViewEventHandler           -- ^ add current tag
  -> (Int -> ViewEventHandler)  -- ^ delete tag
  -> ViewEventHandler           -- ^ clear tags
  -> HTMLView_

createTagsField label tags current_tag set_tag_handler add_tag_handler delete_tag_handler clear_tags_handler = do
  cldiv_ B.inputGroup $ do
    label_ $ elemText label
    input_ [ className_ B.formControl
           , "value" $= textToJSString' current_tag
           , onChange (set_tag_handler . targetValue)
           , onKeyUp (\_ KeyboardEvent{..} -> if keyCode == 13 then add_tag_handler else mempty)
           ]
    span_ [ className_ B.inputGroupBtn
          , "title" $= "Add"
          , onClick (\_ _ -> add_tag_handler)
          ] $ elemText "Add"

  div_ $ do
    mapM_ (\(idx, tag) -> do
      span_ [classNames_ [B.label, B.labelDefault]] $ elemText tag
      span_ [] $ do
        button_ [ classNames_ [B.btn, B.btnDefault, B.btnXs]
                , onClick (\_ _ -> delete_tag_handler idx)
                ] $ span_ [classNames_ [B.glyphicon, B.glyphiconRemove]] $ elemText "✖"
      ) $ toSeqList tags
```

## contributions

Pull requests welcome!
