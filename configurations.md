# Configurations

Full terminal setup: zsh + Oh My Zsh + Powerlevel10k + useful plugins and tools. Run each step in order.

> **Tip:** On Fedora, replace `sudo apt ...` with `sudo dnf ...` as shown in the Fedora blocks below. Everything else (curl-based installers, git clones, `.zshrc` edits) is distro-agnostic.

---

## 1. Update the system and install base packages

### Debian / Ubuntu

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git curl wget zip unzip zsh gnome-tweaks fontconfig
```

### Fedora

```bash
sudo dnf upgrade --refresh -y
sudo dnf install -y git curl wget zip unzip zsh gnome-tweaks fontconfig
```

---

## 2. Install Oh My Zsh (do this right after zsh, before anything else)

> **Important:** Install Oh My Zsh **immediately after** zsh and **before** any other tool that writes to `~/.zshrc` (like Atuin). Otherwise Oh My Zsh may overwrite or conflict with those changes.
>
> **Workflow:**
> 1. Set zsh as default shell
> 2. Install Oh My Zsh
> 3. **Open a new terminal so Oh My Zsh initializes `~/.zshrc`**
> 4. Only then proceed to section 3 onwards

### Set zsh as the default shell

```bash
chsh -s "$(which zsh)"
```

### Install Oh My Zsh (both distros)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Open a new terminal

Close the current terminal and open a new one. Oh My Zsh should load automatically and a fresh `~/.zshrc` will be created.

**Only continue to the next section after this is done.**

---

## 3. LSD — better `ls`

### Debian / Ubuntu

```bash
sudo apt install -y lsd
```

> If `lsd` is not found (older Debian/Ubuntu), install from the [official releases](https://github.com/lsd-rs/lsd/releases):
>
> ```bash
> curl -LO https://github.com/lsd-rs/lsd/releases/latest/download/lsd_1.1.5_amd64.deb
> sudo dpkg -i lsd_1.1.5_amd64.deb && rm lsd_1.1.5_amd64.deb
> ```

### Fedora

```bash
sudo dnf install -y lsd
```

The `alias ls='lsd'` is added later in the `.zshrc` step (section 7).

---

## 4. Atuin — smarter shell history

Replaces the default up-arrow / `Ctrl+R` history with a searchable, synced history.

### Debian / Ubuntu / Fedora

```bash
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
```

---

## 5. MesloLGS NF fonts (required by Powerlevel10k)

### Debian / Ubuntu / Fedora

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
for style in "Regular" "Bold" "Italic" "Bold%20Italic"; do
  wget -q "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20${style}.ttf"
done
fc-cache -f
cd -
```

After installing, open your terminal preferences and set the font to **MesloLGS NF**.

---

## 6. Powerlevel10k theme + plugins

Run the whole block at once (both distros):

```bash
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  "$ZSH_CUSTOM/themes/powerlevel10k"

# Plugins
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions \
  "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting \
  "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

git clone --depth=1 https://github.com/MichaelAquilina/zsh-you-should-use \
  "$ZSH_CUSTOM/plugins/you-should-use"
```

---

## 7. Configure `~/.zshrc`

Run once, both distros:

```bash
# Set Powerlevel10k as the theme
sed -i 's|^ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|' "$HOME/.zshrc"

# Enable plugins
sed -i 's|^plugins=.*|plugins=(git zsh-autosuggestions zsh-syntax-highlighting you-should-use)|' "$HOME/.zshrc"

# LSD alias
grep -qxF "alias ls='lsd'" "$HOME/.zshrc" || echo "alias ls='lsd'" >> "$HOME/.zshrc"

# Docker Compose alias
grep -qxF "alias dc='docker compose'" "$HOME/.zshrc" || echo "alias dc='docker compose'" >> "$HOME/.zshrc"
```

---

## 8. First launch

Open a new terminal. The Powerlevel10k configuration wizard will start automatically — follow the prompts to pick your prompt style. If it doesn't start, run:

```bash
p10k configure
```
