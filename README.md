![image](https://github.com/user-attachments/assets/680862ee-f87d-4c92-98d7-0f927f2014c9)

### Installation

NOTE: All the relevant tools will be installed by Mason automatically but you need certain system packages, e.g `go`, `npm`, etc.; these can be installed trivially via Scoop or any Linux package manager.

#### Linux

```bash
git clone https://github.com/masroof-maindak/nvim.git ~/.config/nvim
```

#### Windows

```powershell
mkdir $env:LOCALAPPDATA\nvim
cd $env:LOCALAPPDATA\nvim
git clone https://github.com/masroof-maindak/nvim.git .
scoop bucket add extras
scoop install neovide
```
