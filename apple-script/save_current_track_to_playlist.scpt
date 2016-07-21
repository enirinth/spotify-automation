tell application "Spotify" to set track_id to id of current track
set playlist_id to <your_playlist_id>
set refresh_token to <your_refresh_token_from_running_spotify_auth_wep_app_example>
set base64_auth to <base_64_encoding_of_string_"client_id:client_secret">

set get_access_token_scpt to "curl -H 'Authorization: Basic " & base64_auth & "' -d grant_type=refresh_token -d refresh_token=" & refresh_token & " https://accounts.spotify.com/api/token"
set result to do shell script get_access_token_scpt

tell application "JSON Helper" to set res to read JSON from result

set oauth_id to access_token of res

do shell script "curl -i -X POST 'https://api.spotify.com/v1/users/{your_spotify_username}/playlists/" & playlist_id & "/tracks?uris=" & track_id & "' -H 'Authorization: Bearer " & oauth_id & "' -H 'Accept: application/json'"


