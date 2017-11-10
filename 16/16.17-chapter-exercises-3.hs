{-# LANGUAGE FlexibleInstances #-}

-- Write `Functor` instances for the following datatypes.
--
-----------------------------------------------------------------------------
-- 1.
data Quant a b = Finance
               | Desk a
               | Bloor b

instance Functor (Quant a) where
  fmap _ Finance   = Finance
  fmap _ (Desk x)  = Desk x
  fmap f (Bloor y) = Bloor (f y)

-----------------------------------------------------------------------------
-- 2.
data K a b = K a

instance Functor (K a) where
  fmap _ (K x)  = K x

-----------------------------------------------------------------------------
-- 3.
newtype Flip f a b = Flip (f b a)
  deriving (Eq, Show)

instance Functor (Flip K a) where
  fmap f (Flip (K a)) = Flip $ K (f a)

-----------------------------------------------------------------------------
-- 4.
data EvilGoateeConst a b = GoatyConst b

instance Functor (EvilGoateeConst a) where
  fmap f (GoatyConst y) = GoatyConst (f y)

-----------------------------------------------------------------------------
-- 5.
data LiftItOut f a = LiftItOut (f a)

instance Functor f => Functor (LiftItOut f) where
  fmap f (LiftItOut fa) = LiftItOut (fmap f fa)

-----------------------------------------------------------------------------
-- 6.
data Parappa f g a = DaWrappa (f a) (g a)

instance (Functor f, Functor f1) => Functor (Parappa f f1) where
  fmap f (DaWrappa fa ga) = DaWrappa (fmap f fa) (fmap f ga)

-----------------------------------------------------------------------------
-- 7.
data IgnoreOne f g a b = IgnoringSomething (f a) (g b)

instance Functor g => Functor (IgnoreOne f g a) where
  fmap f (IgnoringSomething fa gb) = IgnoringSomething fa (fmap f gb)

-----------------------------------------------------------------------------
-- 8.
data Notorious g o a t = Notorious (g o) (g a) (g t)

instance Functor f => Functor (Notorious f a b) where
  fmap f (Notorious fx fy fz) = Notorious fx fy (fmap f fz)

-----------------------------------------------------------------------------
-- 9.
data List a = Nil
            | Cons a (List a)

instance Functor List where
  fmap _ Nil         = Nil
  fmap f (Cons x lx) = Cons (f x) (fmap f lx)

-----------------------------------------------------------------------------
-- 10.
data GoatLord a = NoGoat
                | OneGoat a
                | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)

instance Functor GoatLord where
  fmap _ NoGoat            = NoGoat
  fmap f (OneGoat x)       = OneGoat (f x)
  fmap f (MoreGoats x y z) = MoreGoats (fmap f x) (fmap f y) (fmap f z)

-----------------------------------------------------------------------------
-- 11.
data TalkToMe a = Halt
                | Print  String a
                | Read  (String -> a)

instance Functor TalkToMe where
  fmap _ Halt        = Halt
  fmap f (Print x y) = Print x (f y)
  fmap f (Read f2a)  = Read (fmap f f2a)
