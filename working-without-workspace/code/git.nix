programs.git = {
enable = true;
userName = "Oliver Davies";
userEmail = "oliver@oliverdavies.uk";

aliases = {
aa = "add --all";
assume = "update-index --assume-unchanged";
assumed = "!git ls-files -v | grep '^[hsmrck?]' | cut -c 3-";
b = "branch";
# ...
};
extraConfig = {
branch = {
autosetupmerge = true;
autosetuprebase = "always";
};
checkout.defaultRemote = "origin";
color.ui = true;
commit = {
template = "~/.gitmessage";
};
core = {
editor = "nvim";
excludesFile = "~/.gitignore-global";
pager = "delta";
};
