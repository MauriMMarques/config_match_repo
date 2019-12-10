## Using the `config_match_repo` action for the first time

1. Config a `Matchfile` in the `fatlane`:
* Setup the `git_url` variable with your future certificates repo url direction.
* Setup the `app_identifier` with your application(s) bundle ID(s).
* Setup the environment variable `MATCH_PASSWORD` with a your choice value to be used as your repo criptography password
2. First, create a `actions` folder in your `fastlane` folder and paste the `config_match_repo.rb` inside it.
3. Run the action `fastlane run config_match_repo`

#### At the moment you run the action, the following steps will proceed:
1. The action will access your repo reading the configurations from your `Matchfile`.
2. It will download and decrypt the repo content.
3. Then a `Finder` window will be opened in a decripted repo copied folder.
4. At this moment you will paste your certificates and mobile provisons inside this folder using the same structure descriobed in the Folder Structure section from match [documentation](https://docs.fastlane.tools/actions/match/).
5. After pasting them, all you need to do is go back to the terminal and press any key.
6. The folder will be encrypted again and the changes will be pushed to the repo.

* After that, you can use all match commands normally. Like

```
match(
      type: "development",
      readonly: true,
      verbose: true
)
```

or 

```
match(
      type: "appstore",
      readonly: true,
      verbose: true
)
```

to sync your project with the configured certificates and mobile provisions

## Updating certificates and mobile provisions repo with new ones

To update configured certificates and mobile provisions in your repo, you just need to follow the same steps described above, using `Finder` to replace the current files in the repo for the new ones.