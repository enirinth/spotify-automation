tell application "Spotify" to set track_id to id of current track
set playlist_id to {your_playlist_id}
set oauth_id to {your_access_token}
do shell script "curl -i -X POST 'https://api.spotify.com/v1/users/{your_spotify_username}/playlists/" & playlist_id & "/tracks?uris=" & track_id & "' -H 'Authorization: Bearer " & oauth_id & "' -H 'Accept: application/json'"
