# voice2json-Docker-Compose

A docker-compose.yml to run [voice2json](https://voice2json.org "voice2json") Tested and working with Mic input on Debian based distro.

## Quick setup
- Have Docker & docker compose setup and working
- Clone repo
- Either set the 'volumes' values in the docker-compose.yml or run  `./makeTestVolumes.sh`(this is just a helper script to create the default volume folders in the current directory)
- Run `docker compose up`

## Note
This is a quick setup to test. It is using the standard image of voice2json so requires command line arguments to be fed into the docker entrypoint. If you run it as is, it will output the `voice2json --help`

I have added a few comments to the compose file to explain a little.

## If you want to make a basic working setup
First read the Docker section  of the [official Docs](https://voice2json.org/install.html "official Docs") so you know what I am doing

- Do the Quick setup steps above.
- Open the docker-compose.yml in your favorite editor.
- Note the last line where I send the argument to the entrypoint. Currently set to `command: --help`
- Run `docker compose up` and confirm that you see the help output
- Comment out `command: --help`
- Uncomment `command: --profile en-us_kaldi-zamia download-profile` This will download a profile - see official docs for options
- Run `docker compose up` the system will download a profile to your volume
- Comment out `command: --profile en-us_kaldi-zamia download-profile`
- Uncomment `command: --debug --profile en-us_kaldi-zamia train-profile`
- Run `docker compose up` Your profile will no be trained

- Comment out  `command: --debug --profile en-us_kaldi-zamia train-profile`
- Uncomment `command: --profile en-us_kaldi-zamia transcribe-stream`
- Run `docker compose up` This time your docker will wait for audio input. Say "What time is it" and see the output
- Ctrl-c to exit
-  you only need to run `docker compose up`from now onwards as the setup is complete.

## Gotchas
- Tons, this is just a demo
- Audio with docker is a pain in the ass, your milage may vary.
