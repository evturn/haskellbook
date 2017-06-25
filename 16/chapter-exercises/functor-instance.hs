{-# LANGUAGE FlexibleInstances #-}

-- 1.
data Quant a b = Finance
               | Desk a
               | Bloor b
               deriving (Eq, Show)

instance Functor (Quant a) where
  fmap _ Finance   = Finance
  fmap _ (Desk x)  = Desk x
  fmap f (Bloor y) = Bloor (f y)

-- 2.
data K a b = K a deriving (Eq, Show)

instance Functor (K a) where
  fmap _ (K a) = K a

-- 3.
newtype Flip f a b = Flip (f b a) deriving (Eq, Show)

newtype Functor (Flip K a) where
  fmap f (Flip (K x)) = Flip $ K (f x)

-- 4.
data EvilGoateeConst a b = Goaty b

instance Functor (EvilGoateeConst a) where
  fmap f (EvilGoateeConst x) = EvilGoateeConst (f x)

-- 5.
data LiftItOut f a = LiftItOut (f a)

instance Functor f => Functor (LiftItOut f) where
  fmap f (LiftItOut fa) = LiftItOut (fmap f fa)

-- 6.
data Parappa f g a = DaWrappa (f a) (g a)

instance (Functor f1, Functor f) => Functor (Parappa f1 f) where
  fmap f (DaWrappa x y) = DaWrappa (fmap f x) (fmap f y)

-- 7.
data IgnoreOne f g a b = IgnoringSomething (f a) (g b) deriving (Eq, Show)

instance Functor g => Functor (IgnoreOne f g a) where
  fmap f (IgnoringSomething x y) = IgnoringSomething x $ fmap f y

-- 8.
data Notorious g o a t = Notorious (g o) (g a) (g t)

instance Functor g => Functor (Notorious g o a) where
  fmap f (Notorious x y z) = Notorious x y $ fmap f z

-- 9.
data List a = Nil | Cons a (List a)

instance Functor List where
  fmap _ Nil         = Nil
  fmap f (Cons x xs) = Cons (f x) $ fmap f xs

-- 10.
data GoatLord a = NoGoat
                | OneGoat a
                | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)

instance Functor GoatLord where
  fmap _ NoGoat            = NoGoat
  fmap f (OneGoat x)       = OneGoat (f x)
  fmap f (MoreGoats x y z) = MoreGoats (fmap f x) (fmap f y) (fmap f z)

-- 11.
data TalkToMe a = Halt
                | Print String a
                | Read (String -> a)

instance Functor TalkToMe where
  fmap _ Halt        = Halt
  fmap f (Print x a) = Print x (f a)
  fmap f (Read g)    = Read (fmap f g)