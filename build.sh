#!/bin/bash
readarray -t sources< <(find "$(dirname $0)" -maxdepth 1 -type d -not -name "artifacts" | tail -n +2)
tar -czvf "$(dirname $0)/payload.tgz" "${sources[@]}"
mkdir "$(dirname $0)/artifacts"
cat <(sed '0,/^__INSTALLER__$/d' "$0") "$(dirname $0)/payload.tgz" >"$(dirname $0)/artifacts/installer.sh"
rm payload.tgz
exit 0

__INSTALLER__
#!/bin/bash
[[ $(whoami) != root ]] && sudo "$0"
[[ $(whoami) != root ]] && exit 1
mkdir /tmp/nodothide-install
basedir=/tmp/nodothide-install/
sed '0,/^__ARCHIVE__$/d' "$0" >"$basedir/payload.tgz"
tar -xf "$basedir/payload.tgz" -C "$basedir"
chmod -R +x "$basedir"
components_name+=("CLI Backend" "Wrapper of ls")
components_dir+=("$basedir/CLI" "$basedir/LSH")

echo -e "Checking the file managers installed on the system ...\n"
while read i
do
    fm="$($i/install.sh info)"
    $i/install.sh check && {
        components_name+=("Custom action for $fm")
        components_dir+=("$i")
        echo -e "\e[32mFound: $fm\e[m"
    } || {
        echo "Not found: $fm"
    }
done< <(find "$basedir" -maxdepth 1 -type d -not -name "CLI" -not -name "LSH" | tail -n +2)

echo -e "\nSelect the numbers of the components you wish to install, separated by spaces."
echo "=============================="
echo -e "[X]:\tCLI Backend(Required)"
for i in $(seq 1 $((${#components_name[@]}-1)))
do
    echo -e "[$i]:\tCustom action for ${components_name[$i]}"
done
echo "=============================="
while true
do
    read -p "[Install all]>" toInstall
    [[ "$toInstall" == "" ]] && {
        toInstall=$(seq -s " " 0 $((${#components_name[@]}-1)))
        break
    }
    for j in $toInstall
    do
        ([[ $j =~ ^[0-9]+$ ]] && [[ $j -ge 1 ]] && [[ $j -lt ${#components_name[@]} ]]) || continue 2
    done
    toInstall="0 $toInstall"
    break
done

echo "If it possible, Do you want to install custom action globally?(Y/N)"
while true
do
    read -p "[N]>" input
    [[ "$input" == "Y" ]] || [[ "$input" == "y" ]] && {
        isglobal=1
        break
    } || [[ "$input" == "" ]] || [[ "$input" == "N" ]] || [[ "$input" == "n" ]] && {
        isglobal=0
        break
    }
done

for i in $toInstall
do
    echo -e "\nInstalling ${components_name[$i]}..."
    ${components_dir[$i]}/install.sh install $([[ $isglobal == 1 ]] && echo g) && echo "Success" || echo "Failed"
done

echo -e "Install has finished. Thank you for using installer!"

rm $basedir -rf
exit 0
__ARCHIVE__
