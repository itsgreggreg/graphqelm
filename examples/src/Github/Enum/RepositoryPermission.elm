-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.Enum.RepositoryPermission exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The access level to a repository

  - Admin - Can read, clone, push, and add collaborators
  - Write - Can read, clone and push
  - Read - Can read and clone

-}
type RepositoryPermission
    = Admin
    | Write
    | Read


decoder : Decoder RepositoryPermission
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "ADMIN" ->
                        Decode.succeed Admin

                    "WRITE" ->
                        Decode.succeed Write

                    "READ" ->
                        Decode.succeed Read

                    _ ->
                        Decode.fail ("Invalid RepositoryPermission type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : RepositoryPermission -> String
toString enum =
    case enum of
        Admin ->
            "ADMIN"

        Write ->
            "WRITE"

        Read ->
            "READ"
