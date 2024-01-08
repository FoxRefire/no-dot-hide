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
�      �\�r�6���)`Fu�dxEJ���i�I��6�N���Y�P$$��H�_j�����$Ņ�H���D�	�I,�� ��áHU��,О�:Aǲ�'�Xz�3�3hZf���@�x�C��π��^�H�� �(������P�\�S�"%��J/|���ndP�M�R��lq���$�Z-�}7������/D��5��P�Ş��dh�akA:f3�ǅk��+�����_/K�	�k�wBsc�G$�l��[Iz�!
܃���O����h���c+���@]�x~������h*}��88j�H� 9� ��;�ҝ$}p��9�2/�ؙ�r�a_sх�'���1���-�Y�tue� 7�z@��`8�y�3'�G.}�@CoV�N2��$
�hj���c�iri_h�w4�%n �4��`B6&̐����^����D'�M
d�BՐ�
SI>��!�d�bM6���<)7��+ܰ��Ͼ�5�=�k��)��tK�:���_�.���`�C����g�ς&���a���ׁ��n�֏����z�z'(���8-�����Ƿ�;<C��,�Oޢ^�ʗp�}W9&�Z����o���uc������?6�޼}�1��پ=Aa%to>�~����
��IdS��.�᧰��i[��)�9���:r�M�r��_r����$�^�>(�G~:�m���AN�t������.el���ae�ϲt������ ��9'k@�Ⱦ��o$p#������jC�����⨎�>��m{+�J�#n�b���c��8;����zh��?7��j�}f?���z��?q	��u ��^��V��ږ���LC�Z���@�[��4�#�J$��
���%@��p2���a>����y��v��`�[X�T>?�����������-����r�_6�c�8*�]9{�}��{��J���~~�m�P��CfL�?���ѡ�?���9��>��Y������e#g���#F���[fG��j�����;���Y�,����\��U-�&��3� �G���%�_-X��������(%��l�������|����s��#ǎA�h�l(>P �uW��O4�?-ql�j�5��8H�L��R�ٖЗ�M������_��]����:���cA�3a
���E�]�`t�@q�X�� (J_�r+�K_u11�~Wc$I���;v5v��DɈ����;����?&H�nvt��/��Ѐ�vK�
�j�\R�	f�����t�ղ+$��?v_���S$3��	��j��2��������w���21�4��
;ڲ4�ژK���t���\�tuY=�-�[����}
�PՎ���<�a���O���,���Z���lmo26���,��5�6��B��kA��I�xz ���<N���x�o w��憲D��>�����#�����5r���K�JZp�/��Ŕ/�`r�_m��<^D�`x�5^������6y�lh�*D�,N�>�#0B�'�ƀ|��yH%,w�l`FF��"L�_9����T�S����?��0����7Zm��o-X9����ʣq��s#��G��6[A�~>��)�{�����W����8��o����?V�2-������@����`����`����ϙ+�kok�Y=}���I��w$7��\��!�c�'(}���]�_���-d�(\U�.Q���,��E�B7���*K���C�\�dv�}:���r�t.�s�]M�4k��T�Y�����&�|T�-7�nx�a��������8<\��d+.�_.�:�gZ/2vIS�r�OFK
�/��E�:]|s�C�P!�Em�� ������5p��9Iዼ&�����pQ����*r�ι�?�d*d��,�?̰~�.v�8�(��ʊ�XZm�ai���dRٜaic<+-O�W�����=���˲�؍����w���B��3;�t7��:��F[���<���լl٫�Εs�g���<�M&�vΣ\N�3��MΪ<N�����ٖ6��@��%g�1YF�o(����c{�~�+�)e�i��>7K��-�Ϝ�t�Ûe�{�eNt��i����d\��å?,��'8��TĎ�
���S����z����|�^��^uL\N�g�F�L U7�^�.
Brk8�N~���f-f���̈́������Y������c����a�"�[>!�C�;��"                               ����8 x  