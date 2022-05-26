#!/bin/sh

main(){

    printf "What do you want to know? (Type z for zelda, p for pokemon or b for pokemon_battled)\n"
    read -r option

    if [ "$option" = "z" ]; then
        if [ -z "$option" ]; then
            echo 'You need to pass a input'
            exit 1
        else
            zelda
        fi
    else
        if [ "$option" = "b" ]; then
            if [ -z "$option" ]; then
                echo 'You need to pass a input'
                exit 1
            else
                poke_battle
            fi
        else
            if [ "$option" = "p" ]; then
                if [ -z "$option" ]; then
                    echo 'You need to pass a input'
                    exit 1
                else
                    pokemon
                fi
            else
                echo 'You need to pass a input. Valid inputs are: z, b or p'
                exit 1
            fi
        fi
    fi

}

zelda(){
    printf "Which creature do you want to search? \n"
    read -r option
    curl -s https://botw-compendium.herokuapp.com/api/v2/entry/"$option" | jq -r '. | "\n\("===================")\n\("Basic Information")\n\("===================")\n\("Name: ")\(.data.name)\n\("ID: ")\(.data.id)\n\("Category: ")\(.data.category)\n\("Description: ")\(.data.description)\n\("===================")\n\("Common Locations")\n\("===================")\n\("Location 1: ")\(.data.common_locations[0])\n\("Location 2: ")\(.data.common_locations[1])\n\("===================")\n\("Drops")\n\("===================")\n\("Drop 1: ")\(.data.drops[0])\n\("Drop 2: ")\(.data.drops[1])\n\("Drop 3: ")\(.data.drops[2])\n"'
}

pokemon(){
    printf "Which pokemon do you want to search? \n"
    read -r option
    curl -s https://pokeapi.co/api/v2/pokemon/"$option" | jq -r '. | "\n\("===================")\n\("Basic Information")\n\("===================")\n\("Pokemon: ")\(.name)\n\("ID: ")\(.id)\n\("Type 1: ")\(.types[0].type.name)\n\("Type 2: ")\(.types[1].type.name)\n\("===================")\n\("Base Stats")\n\("===================")\n\("HP: ")\(.stats[0].base_stat)\n\("Attack: ")\(.stats[1].base_stat)\n\("Defense: ")\(.stats[2].base_stat)\n\("Special Attack: ")\(.stats[3].base_stat)\n\("Special Defense: ")\(.stats[4].base_stat)\n\("Speed: ")\(.stats[5].base_stat)"'
}

poke_battle(){
    printf "Which poke-battle do you want to simulate? (First Pokemon)\n"
    read -r option
    printf "Which poke-battle do you want to simulate? (Second Pokemon)\n"    
    read -r option2
    poke1="$(curl -s https://pokeapi.co/api/v2/pokemon/"$option" | jq -r '.types[0].type.name')"
    poke2="$(curl -s https://pokeapi.co/api/v2/pokemon/"$option2" | jq -r '.types[0].type.name')"

    case $poke1 in
    normal)
        if [ "$poke2" = "rock" ] || [ "$poke2" = "steel" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "ghost" ]; then
                echo "\n$2 has no effect against $3"
            else
                echo "\n$2 has normal effect against $3"
            fi
        fi;;
    fire)
        if [ "$poke2" = "fire" ] || [ "$poke2" = "water" ] || [ "$poke2" = "rock" ] || [ "$poke2" = "dragon" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "grass" ] || [ "$poke2" = "ice" ] || [ "$poke2" = "bug" ] || [ "$poke2" = "steel" ]; then
                echo "\n$2 is super-effective against $3"
            else
                echo "\n$2 has normal effect against $3"
            fi
        fi;;
    water)         
        if [ "$poke2" = "water" ] || [ "$poke2" = "grass" ] || [ "$poke2" = "dragon" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "fire" ] || [ "$poke2" = "ground" ] || [ "$poke2" = "rock" ]; then
                echo "\n$2 is super-effective against $3"
            else
                echo "\n$2 has normal effect against $3"
            fi
        fi;;
    electric)        
        if [ "$poke2" = "electric" ] || [ "$poke2" = "grass" ] || [ "$poke2" = "dragon" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "water" ] || [ "$poke2" = "flying" ]; then
                echo "\n$2 is super-effective against $3"
            else
                if [ "$poke2" = "ground" ]; then
                    echo "\n$2 has no effect agains $3"
                else
                    echo "\n$2 has normal effect against $3"
                fi
            fi
        fi;;
    grass)        
        if [ "$poke2" = "fire" ] || [ "$poke2" = "grass" ] || [ "$poke2" = "poison" ] || [ "$poke2" = "flying" ] || [ "$poke2" = "bug" ] || [ "$poke2" = "dragon" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "water" ] || [ "$poke2" = "ground" ] || [ "$poke2" = "rock" ]; then
                echo "\n$2 is super-effective against $3"
            else
                echo "\n$2 has normal effect against $3"
            fi
        fi;;
    ice)         
        if [ "$poke2" = "fire" ] || [ "$poke2" = "water" ] || [ "$poke2" = "ice" ] || [ "$poke2" = "steel" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "grass" ] || [ "$poke2" = "ground" ] || [ "$poke2" = "flying" ] || [ "$poke2" = "dragon" ]; then
                echo "\n$2 is super-effective against $3"
            else
                echo "\n$2 has normal effect against $3"
            fi
        fi;;
    fighting)         
        if [ "$poke2" = "poison" ] || [ "$poke2" = "flying" ] || [ "$poke2" = "psychic" ] || [ "$poke2" = "bug" ] || [ "$poke2" = "fairy" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "normal" ] || [ "$poke2" = "ice" ] || [ "$poke2" = "rock" ] || [ "$poke2" = "dark" ] || [ "$poke2" = "steel" ]; then
                echo "\n$2 is super-effective against $3"
            else
                if [ "$poke2" = "ghost" ]; then
                    echo "\n$2 has no effect agains $3"
                else
                    echo "\n$2 has normal effect against $3"
                fi
            fi
        fi;;
    poison)         
        if [ "$poke2" = "poison" ] || [ "$poke2" = "ground" ] || [ "$poke2" = "rock" ] || [ "$poke2" = "ghost" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "grass" ] || [ "$poke2" = "fairy" ]; then
                echo "\n$2 is super-effective against $3"
            else
                if [ "$poke2" = "steel" ]; then
                    echo "\n$2 has no effect agains $3"
                else
                    echo "\n$2 has normal effect against $3"
                fi
            fi
        fi;;
    ground) 
        if [ "$poke2" = "grass" ] || [ "$poke2" = "bug" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "fire" ] || [ "$poke2" = "electric" ] || [ "$poke2" = "poison" ] || [ "$poke2" = "rock" ] || [ "$poke2" = "steel" ]; then
                echo "\n$2 is super-effective against $3"
            else
                if [ "$poke2" = "flying" ]; then
                    echo "\n$2 has no effect agains $3"
                else
                    echo "\n$2 has normal effect against $3"
                fi
            fi
        fi;;
    flying)         
        if [ "$poke2" = "electric" ] || [ "$poke2" = "rock" ] || [ "$poke2" = "steel" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "grass" ] || [ "$poke2" = "fighting" ] || [ "$poke2" = "bug" ]; then
                echo "\n$2 is super-effective against $3"
            else
                echo "\n$2 has normal effect against $3"
            fi
        fi;;
    psychic)  
        if [ "$poke2" = "psychic" ] || [ "$poke2" = "steel" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "fighting" ] || [ "$poke2" = "poison" ]; then
                echo "\n$2 is super-effective against $3"
            else
                if [ "$poke2" = "dark" ]; then
                    echo "\n$2 has no effect agains $3"
                else
                    echo "\n$2 has normal effect against $3"
                fi
            fi
        fi;;
    bug)    
        if [ "$poke2" = "fire" ] || [ "$poke2" = "fighting" ] || [ "$poke2" = "poison" ] || [ "$poke2" = "flying" ] || [ "$poke2" = "ghost" ] || [ "$poke2" = "steel" ] || [ "$poke2" = "fairy"]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "grass" ] || [ "$poke2" = "psychic" ] || [ "$poke2" = "dark" ]; then
                echo "\n$2 is super-effective against $3"
            else
                echo "\n$2 has normal effect against $3"
            fi
        fi;;
    rock)   
        if [ "$poke2" = "fighting" ] || [ "$poke2" = "ground" ] || [ "$poke2" = "steel" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "fire" ] || [ "$poke2" = "ice" ] || [ "$poke2" = "bug" ] || [ "$poke2" = "flying" ]; then
                echo "\n$2 is super-effective against $3"
            else
                echo "\n$2 has normal effect against $3"
            fi
        fi;;
    ghost)  
        if [ "$poke2" = "dark" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "ghost" ] || [ "$poke2" = "psychic" ]; then
                echo "\n$2 is super-effective against $3"
            else
                if [ "$poke2" = "normal" ]; then
                    echo "\n$2 has no effect agains $3"
                else
                    echo "\n$2 has normal effect against $3"
                fi
            fi
        fi;;
    dragon) 
        if [ "$poke2" = "steel" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "dragon" ]; then
                echo "\n$2 is super-effective against $3"
            else
                if [ "$poke2" = "fairy" ]; then
                    echo "\n$2 has no effect agains $3"
                else
                    echo "\n$2 has normal effect against $3"
                fi
            fi
        fi;;
    dark)   
        if [ "$poke2" = "fighting" ] || [ "$poke2" = "dark" ] || [ "$poke2" = "fairy" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "psychic" ] || [ "$poke2" = "ghost" ]; then
                echo "\n$2 is super-effective against $3"
            else
                echo "\n$2 has normal effect against $3"
            fi
        fi;;
    steel)  
        if [ "$poke2" = "fire" ] || [ "$poke2" = "water" ] || [ "$poke2" = "electric" ] || [ "$poke2" = "steel" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "ice" ] || [ "$poke2" = "rock" ] || [ "$poke2" = "fairy" ]; then
                echo "\n$2 is super-effective against $3"
            else
                echo "\n$2 has normal effect against $3"
            fi
        fi;;
    fairy)  
        if [ "$poke2" = "fire" ] || [ "$poke2" = "fighting" ] || [ "$poke2" = "steel" ]; then
            echo "\n$2 is not very effective against $3"
        else 
            if [ "$poke2" = "fighting" ] || [ "$poke2" = "dark" ] || [ "$poke2" = "dragon" ]; then
                echo "\n$2 is super-effective against $3"
            else
                echo "\n$2 has normal effect against $3"
            fi
        fi;;
    *) echo "Opcao Invalida!" ;;
    esac
}

main "$@"