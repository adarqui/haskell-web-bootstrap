{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE Rank2Types     #-}

module Web.Bootstrap3.Types (
  ClassName,
  className
) where



import           Data.String (IsString)



type ClassName = forall a. IsString a => a



className :: a -> a
className = id
