From [fantasy-land](https://github.com/fantasyland/fantasy-land)

[Functor](https://github.com/fantasyland/fantasy-land#functor)
---------------
map :: Functor f => f a ~> (a -> b) -> f b

[Apply](https://github.com/fantasyland/fantasy-land#apply)
---------------
ap :: Apply f => f a ~> f (a -> b) -> f b

[Applicative](https://github.com/fantasyland/fantasy-land#applicative)
---------------
of :: Applicative f => a -> f a

```javascript

  Array.of = x => [x]
  Either.of = x => Right(x)
  Function.of = x => _ => x
  Maybe.of = x => Just(x)
  Task.of = x => new Task((_, res) => res(x))

```

[Chain](https://github.com/fantasyland/fantasy-land#Chain)
---------------
chain :: Chain m => m a ~> (a -> m b) -> m b


Comparison
---------------

|Language   |Library         |Functor |Apply |Applicative |Chain |
|-----------|----------------|--------|------|------------|------|
|Haskel     |out of box      |<$>|fmap|<*>   |pure        |>>=   |
|JavaScript |ramda-fantasy   |map     |ap    |of          |chain |
|Ruby       |dry-monads      |fmap    |      |pure        |bind  |
|Ruby       |kleisli         |fmap    |*     |            |>     |
|Ruby       |ramda-ruby      |map     |ap    |            |chain |
