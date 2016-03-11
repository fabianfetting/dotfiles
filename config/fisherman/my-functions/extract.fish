function extract --description "Expand or extract bundled & compressed files"
    for file in $argv
        if test -f $file
            echo -s "Extracting " (set_color green) $file (set_color normal)
            switch $file
            case *.tar
                tar -xvf $file
            case *.tar.bz2 *.tbz2
                tar -jxvf $file
            case *.tar.gz *.tgz
                tar -zxvf $file
            case *.bz2
                bunzip2 $file
            case *.gz
                gunzip $file
            case *.rar
                unrar x $file
            case *.zip *.ZIP
                unzip $file
            case *.pax
                pax -r < $file
            case '*'
                echo "Extension not recognized, cannot extract $file"
            end
        else
            echo "$file is not a valid file"
        end
    end
end