# Spotify Automation
The idea is simple -- enable global shortcuts to control Spotify
      
Imagine you are listening to some track recommended by Spotify while working on something else (say brwosing with Chrome). Suddenly you find the track very cool and want to save it, what would you do?     
-- Switch to Spotify app and click add to playlist XXX / drag track to playlist XXX ?     
-- Or simply just click a shortcut?    

With the power of AppleScript and Automator on OSX, we are able to implement this and similar global control over spotify automation 
Reference:    
http://stackoverflow.com/questions/12675168/spotify-applescript-add-current-track-to-playlist     
https://developer.spotify.com/web-api/  


0. Preparation
Make sure you have node.js installed
Make sure you installed "Json Helper for AppleScript” from Mac App Store (AppleScript doesn’t have a handy json parser)
1. Register an app at https://developer.spotify.com
Fill in ApplicationName and Description whatever you like
Make sure to set redirect URI to http://localhost:8888/callback
2. Get refresh token -- the dummy part :(
Run Spotify oauth example from https://github.com/spotify/web-api-auth-examples/
Install dependencies:          
 $ nam install
Choose authorization code
$ cd authorization_code
Edit app.js
Fill in your info here from the app you just registered:
var client_id = ''; // Your client id 
var client_secret = ''; // Your secret
var redirect_uri = ''; // Your redirect uri
Add 'playlist-modify-public' and 'playlist-modify-private' to permissions here:
// your application requests authorization
  var scope = 'user-read-private user-read-email'
Run:                  
 $ cd authorization_code        
 $ node app.js 
Open http://localhost:8888/ in your browser
Get refresh token (NOT access token)
3. Setup AppleScript
Base64 encode(e.g.) your client id and client secret from the app you registered at My Apps, in the string form “client_id:client_secret” 
Make sure you know which playlist you want to save by right click the target playlist –> copy playlist link –> the link will be in the form “https://open.spotify.com/user/{your_username}/playlist/{your_playlist_id}"
Open OSX automator, choose "Service", select "Utiliteis" -> "Run AppleScript" to create a new service, and paste the applescript into "(* Your script goes here *)” :
(Also make sure you choose "Service receives no input in any application" )

4. Setup shortcut
Save the automator service in whatever name your want, say “spotify-save-current”
Go to “Keyboard" – “Shortcuts" – “Services" – “General", and set your preferable shortcut for “spotify-save-current”
—Tada!
