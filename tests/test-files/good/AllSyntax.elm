module AllSyntax (fn, tuple, Type, Union(A, B, C), Union2(..)) where

{-| An example of all valid Elm syntax.

# Section
@docs fn
-}

-- Comments before imports

import Json.Decode as Json
import List exposing (..)


--
-- Imports starting with S
--

import Signal exposing (foldp, map)
import String


type Data x y z
    = A
    | B Int
    | C (List Int)
    | D { f1 : Bool, f2 : x }
    | E (y -> z)


type alias Type =
    String


type alias TypeWithArgs a b c =
    List ( a, b, { field : c } )


type alias MoreTypes x y z =
    { x | field : y, rec : { z : z }, fn : y -> String -> x }


type alias ParensInTypes a b c =
    { f1 : a -> b
    , f2 : (a -> b) -> c
    , f3 : c -> List (a -> b)
    , f4 : List (List (List b))
    , f5 : List Type
    , f6 : ( a -> b, List (List c) )
    , f7 : List Type -> (a -> List b) -> List c
    }


type alias MultilineRecordType =
    { x : Int
    , y : Int
    , z : Int
    }


type alias MultilineRecordExtension a =
    { a
        | b : Bool
        , c : Char
    }


type alias NestedRecords a =
    { f1 : Int
    , f2 : { singleLine : () }
    , f3 :
        { multiline1 : ( (), () )
        , multiline2 : { inner : List Char }
        , multiline3 :
            { a
                | multiline' : Bool
            }
        }
    , f4 :
        { single : {} }
    , f5 :
        MoreTypes Int Float Bool
    }


{-| A function.
-}
fn =
    "XYZZY"


annotatedFn : String
annotatedFn =
    "XYZZY"


fn2 :
    { x : Int
    , y : String
    }
    -> String
    -> { a
        | x : Float
       }
    -> Int
fn2 _ _ _ =
    999



----------------
--- Comments ---
----------------


comments1 =
    -- comments inside declaration
    ()


comments2 =
    1
        -- plus
        -- plus
        +
            3


comments3 =
    let
        -- The return value
        x = ()

        {- comment after definitions -}
        -- ...
    in
        {- let body -}
        x


comments4 =
    case bool of
        -- This case is for True
        True ->
            -- return unit
            ()

        {- Here's a case for anything else -}
        _ ->
            {- return unit -}
            ()


comments5 =
    if True then
        -- do the right thing
        ()
    else if False then
        -- do something
        -- redundant
        ()
    else
        {- do the wrong thing -}
        ()


comments6 =
    \x ->
        -- we compute using x
        x * x


comments7 =
    let
        x =
            case True of
                _ ->
                    ()

        -- comments
        y = ()
    in
        ()


comments8 =
    [ {- A -} 7 {- X -}
    , -- B
      -- C
      8
      -- Y
      -- Z
    ]


escapedString =
    let
        normals = "a b'`<>{}/ڥ😀ぁ⾃𝟟"

        specials = "\t\n\\\""

        controls1 = "\x00\x01\x02\x03\x04\x05\x06\x07\x08\x0B\x0C\x0D\x0E\x0F"

        controls2 = "\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1A\x1B\x1C\x1D\x1E\x1F"

        controls3 = "\x7F"

        otherNonPrint = "\x06DD\xFFFB\x110BD\xE007F"

        whitespace = "\xA0\x2000\x205F"
    in
        ()


escapedChar =
    let
        normals = [ 'a', ' ', '/', '"', 'ڥ', '😀', 'ぁ', '⾃', '𝟟' ]

        specials = [ '\t', '\n', '\\', '\'' ]

        controls = [ '\x00', '\x1F', '\x7F' ]

        otherNonPrint = [ '\x06DD', '\xFFFB', '\x110BD', '\xE007F' ]

        whitespace = [ '\xA0', '\x2000', '\x205F' ]
    in
        ()


mutltiString =
    let
        s = """normals = "a b'`<>{}/ڥ😀ぁ⾃𝟟"
"\t\\
\x00\x01\x02\x03\x04\x05\x06\x07\x08\x0B\x0C\x0D\x0E\x0F
\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1A\x1B\x1C\x1D\x1E\x1F
\x7F
\x06DD\xFFFB\x110BD\xE007F
\xA0\x2000\x205F
"""
    in
        ()


inlinePipeline =
    1 |> (+) 2


tuple =
    ( 1, 2 )


tupleFunction =
    (,,,) 1 2 3 4


multilineTuple a b =
    ( 1
    , if b then
        2
      else
        3
    , (+) 3 4
    , 7
        + 9
    )


vars =
    ( Foo
    , Too
    , Bar
    )


lists =
    ( [ 1, 2, 3, 4 ], [] )


multilineLists =
    [ "one"
    , "two"
    , "three"
    ]


nestedMultilineLists =
    [ []
    , [ [], [ "1" ] ]
    , [ [ "a"
        , "b"
        ]
      ]
    , [ [] ]
    ]


functionCallInMultilineList =
    [ [ [ toString "a" ] ]
    , [ [ toString
            "a"
        ]
      ]
    ]


commentedLiterals =
    ( {- int -} 1, {- float -} 0.1, {- char -} 'c', {- string -} "str", {- boolean -} True )


infixOperator =
    1 + 2 * 3 / 4 // 5 |> (+) 0


multilineInfixOperators =
    1
        + 2
        * 3
        / 4
        // 5
        |> (+) 0


commentedInfixOperator =
    1 {- plus -} + 2


unaryOperator a =
    -(1) + -2 + -a


multilineUnaryOperator a =
    -(if a then
        1
      else
        2
     )


functionApplication =
    toString 10


commentedFunctionApplication =
    toString {- arg1 -} 10


multilineFunctionApplication =
    List.map
        toString
        [ 1, 2, 3 ]


functionWithParam a =
    a


functionParameters a b ( t, s, _, ( t', s', _, ( t'', s'' ), { x', y' } ) ) { x, y } _ =
    ()


patternAlias ({ x, y } as r) ( a, { b } as r' ) =
    r.x == y


fnAsLambda =
    (\a -> a)


fnAsUnparenthesizedLambda =
    \arg -> arg


multiArgLambda =
    \a b ( t, s, _, ( t', s', _, ( t'', s'' ), { x', y' } ) ) { x, y } _ -> \c -> (\d -> ())


multilineLambda =
    \a ->
        \b c ->
            \d -> e


parenthesizedExpressions =
    (1 + (2 * 3) / 4) |> ((+) 0)


multilineParenthesizedExpressions =
    graphHeight
        / (if range == 0 then
            0.1
           else
            toFloat range
          )
        ==/== (if range == 0 then
                0.2
               else
                toFloat (range - 1)
              )
        <<>> (if range == 0 then
                -1.0
              else
                0.0
             )


multilineParenthesizedExpressions =
    (if range == 0 then
        0.1
     else
        toFloat range
    )


recordAccess r =
    r.f1


recordAccessAsFunction r =
    .f1 r


multilineRecordAccess f =
    (True
        |> f
    ).f1


multilineRecordUpdate r f =
    { r
        | f1 = 1
        , f2 = 2
    }.f2


multilineRecordAccess r f =
    { f1 = 1
    , f2 = 2
    }.f2


chainedRecordAccess r =
    ((r.f1.f2).f3.f4
        ()
    ).f5.f6


multilineRecordLiteral =
    { f1 = ()
    , f2 = 2
    }


singleLineRecord =
    (addStatus { id = 50 }.f1)


singleLineRecordUpdate x =
    (always { x | f1 = 20 }.f1)


letExpression =
    let
        x = 1
    in
        x


multilineDeclarationInLet =
    let
        string =
            "String"

        string' =
            "String Prime"
    in
        string


ifStatement b =
    if b == "y" then
        "YES"
    else if b == "Y" then
        "yes"
    else
        "No"


caseStatement mb =
    case mb of
        Just True ->
            "+"

        Just _ ->
            "_"

        Nothing ->
            "."


multilineExpressionsInsideList =
    [ let
        x = 1
      in
        x
    , if True then
        2
      else if False then
        3
      else
        4
    , case True of
        _ ->
            5
    , [ 6
      , 7
      ]
        |> head
        |> Maybe.withDefault 8
    , \a ->
        9
    ]


multilineExpressionsInsideTuple =
    ( let
        x = 1
      in
        x
    , if True then
        2
      else if False then
        3
      else
        4
    , case True of
        _ ->
            5
    , [ 6
      , 7
      ]
        |> head
        |> Maybe.withDefault 8
    , \a ->
        9
    , foo
        10
    , ( 11
      , 12
      )
    , { x = 13
      , y = 14
      }
    , { a
        | x = 15
        , y = 16
      }
    )


multilineExpressionsInsideRecord =
    { a =
        let
            x = 1
        in
            x
    , b =
        if True then
            2
        else if False then
            3
        else
            4
    , c =
        case True of
            _ ->
                5
    , d =
        [ 6
        , 7
        ]
            |> head
            |> Maybe.withDefault 8
    , e =
        \a ->
            9
    }


multilineIfCondition a =
    if
        if a == Nothing then
            True
        else
            False
    then
        "Yes"
    else if
        if b == Nothing then
            True
        else
            False
    then
        "Perhaps"
    else
        "No"


multilineCaseSubject a =
    case
        if a == Nothing then
            "X"
        else
            "Y"
    of
        _ ->
            ()


singleLineRange =
    [{ f1 = 6 }.f1..(9 + 6 |> (-) 2) + 2]


multilineRange =
    [
        if True then
            1
        else
            2
    ..
        if False then
            3
        else
            5
    ]


nestedMultilineRange =
    [ [
        if True then
            1
        else
            2
      ..
        if False then
            3
        else
            5
      ]
    , [4..2]
    ]


indentedMultilineInsideMultilineInfixApplication =
    div [ id "page" ]
        + { x = 1
          , y = 2
          }
        <| { x = 1
           , y = 2
           }
        *** { x = 1
            , y = 2
            }
        <<>> { x = 1
             , y = 2
             }
        ==/== { x = 1
              , y = 2
              }


port runner : Signal (Task.Task x ())
port runner =
    Console.run console


infixl 4 |.
(|.) : D3 a b -> D3 b c -> D3 a c
(|.) =
    chain


infix 1 <>
infixr 9 ==/==
