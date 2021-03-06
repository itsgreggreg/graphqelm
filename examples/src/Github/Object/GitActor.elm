-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.Object.GitActor exposing (..)

import Github.InputObject
import Github.Interface
import Github.Object
import Github.Scalar
import Github.Union
import Graphqelm.Field as Field exposing (Field)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.GitActor
selection constructor =
    Object.selection constructor


type alias AvatarUrlOptionalArguments =
    { size : OptionalArgument Int }


{-| A URL pointing to the author's public avatar.

  - size - The size of the resulting square image.

-}
avatarUrl : (AvatarUrlOptionalArguments -> AvatarUrlOptionalArguments) -> Field Github.Scalar.Uri Github.Object.GitActor
avatarUrl fillInOptionals =
    let
        filledInOptionals =
            fillInOptionals { size = Absent }

        optionalArgs =
            [ Argument.optional "size" filledInOptionals.size Encode.int ]
                |> List.filterMap identity
    in
    Object.fieldDecoder "avatarUrl" optionalArgs (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map Github.Scalar.Uri)


{-| The timestamp of the Git action (authoring or committing).
-}
date : Field (Maybe Github.Scalar.GitTimestamp) Github.Object.GitActor
date =
    Object.fieldDecoder "date" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map Github.Scalar.GitTimestamp |> Decode.nullable)


{-| The email in the Git commit.
-}
email : Field (Maybe String) Github.Object.GitActor
email =
    Object.fieldDecoder "email" [] (Decode.string |> Decode.nullable)


{-| The name in the Git commit.
-}
name : Field (Maybe String) Github.Object.GitActor
name =
    Object.fieldDecoder "name" [] (Decode.string |> Decode.nullable)


{-| The GitHub user corresponding to the email field. Null if no such user exists.
-}
user : SelectionSet decodesTo Github.Object.User -> Field (Maybe decodesTo) Github.Object.GitActor
user object =
    Object.selectionField "user" [] object (identity >> Decode.nullable)
