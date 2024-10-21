# LichenTown-RP
 Resource packs for the LichenTown server.
# Environment Setup
Follow these steps to set up an environment to publish changes to the server resource pack.

### Prerequisites

1. **Github Desktop**: Install the Github Desktop App. You can download it from [https://desktop.github.com/download/](https://desktop.github.com/download/).
2. **Minecraft: Java Edition**: Ensure you have Minecraft installed.

### Steps

1. ### **Downloading the Workspace**

    In **Github Desktop:**

    - Click on `File` > `Clone repository`.
    - Select the `URL` tab.
    - Enter the repository URL: `https://github.com/palmmc/LichenTown-RP.git`.
    - Choose the folder where you want to clone the workspace.
    - Click `Clone`.

2. ### **Setting your Minecraft Location**

    Open the `config.json` file, and change your `destinationFolder` to your Minecraft resource packs folder.
    > `[?]` - You can get your folder by clicking the 'Resource Packs' button in-game, and copying the path of the folder that opens.
    >
    > `[!]` - Make sure all `\` characters are doubled for a valid folder path.

    ### Example:
    ```json
    {
        "closeOnCompletion": false,
        "destinationFolder": "C:\\Users\\Example\\AppData\\Roaming\\ModrinthApp\\profiles\\LichenTown\\resourcepacks"
    }
    ```

3. ### **Testing Changes**

    Now we can begin editing the packs!
    You can edit a resource pack by going into the `/build/` folder, entering the pack, and making any changes you want.

    Once you are done, you can test you changes in Minecraft by running the `local_deploy.bat` file.
    To reload your resource packs, press `F3+T` at the same time.

4. ### **Uploading your Changes**
    1. **Commit Changes**
    
        - Go back to the GitHub Desktop app.
        - You should see your changes listed under `Changes`.
        - Enter a short message describing your changes.
        - Click `Commit to main`.
    
    2. **Push Changes**
    
        - Click `Push origin` to finally push your changes to GitHub.
    
    3. **Create Pull Request**
    
        - After pushing, you will see a prompt to create a pull request.
        - Click `Create Pull Request`.
        - This will open a web browser with the pull request form pre-filled.
        - Add any additional information or comments.
        - Click `Create Pull Request`.
       
With that done, now just wait for your changes to be approved.
If you would like, you can additionally message `palm1` on discord to inform me you have made changes.

# Additional Warnings ⚠️
- **MAKE SURE** to update your local workspace to the latest version *before* you make any changes.
  - In the Github Desktop app, go to your workspace repository.
  - In the 3 tabs second from the top, click the 'Fetch origin' tab.
    - If it says 'No local changes', you're good.
    - If it says there are changes, click 'Pull origin', and you're done!

# Good luck!
I look forward to seeing future contributions!
