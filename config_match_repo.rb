require 'match'
require 'fastlane_core/configuration/configuration'
require 'io/console'

module Fastlane
    module Actions
      class ConfigMatchRepoAction < Action
        def self.run(params)
            params = FastlaneCore::Configuration.create(Match::Options.available_options, Hash.new)
            params.load_configuration_file("Matchfile")

            git_url = params[:git_url]
            shallow_clone = false
            branch = 'master'

            storage = Match::Storage.for_mode('git', { git_url: git_url, shallow_clone: shallow_clone, git_branch: branch, clone_branch_directly: false})
            storage.download

            encryption = Match::Encryption.for_storage_mode('git', { git_url: git_url, working_directory: storage.working_directory})
            encryption.decrypt_files

            repo_dir = storage.working_directory

            system('open', repo_dir)

            File.open(File.join(repo_dir, '.gitignore'), "w+") { |file| file.write("*.DS_Store") }

            UI.important "Configure the repository path with the certificates and profile as indicated in the Folder Structure section of the Match documentation https://docs.fastlane.tools/actions/match/ ..."
            UI.important "After configuring the repository folder press any key"                                                                                                    
            STDIN.getch                                                                                                              
            UI.message "Encrypting repository folder..."

            encryption.encrypt_files

            storage.save_changes!(files_to_commit: ["."])
        end
      end
    end
end

