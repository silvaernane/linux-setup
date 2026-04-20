# Tips

## Clone Obsidian vault via SSH (no username/password required)

Cloning over SSH avoids having to enter your GitHub credentials every time you push or pull.

### 1. Generate an SSH key (if you don't have one)

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Accept the default path (`~/.ssh/id_ed25519`) and optionally set a passphrase.

### 2. Add the public key to GitHub

Copy the public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Then go to **GitHub → Settings → SSH and GPG keys → New SSH key**, paste it, and save.

### 3. Test the connection

```bash
ssh -T git@github.com
```

Expected output: `Hi <your-username>! You've successfully authenticated...`

### 4. Clone the Obsidian vault

```bash
git clone git@github.com:<your-username>/<your-vault-repo>.git
```

Replace `<your-username>` and `<your-vault-repo>` with your actual GitHub username and repository name.

### Switching an existing clone from HTTPS to SSH

If you already cloned the repo over HTTPS, update the remote URL:

```bash
git remote set-url origin git@github.com:<your-username>/<your-vault-repo>.git
```
