# author: Abby Stamm
# date: 27 November 2023
# purpose: create dataset to join to penguins
#          for workshop session 4

# penguin names and some other detail 
# - diet - preferred and occasional
# - gentoo: krill, shrimp, sometimes fish, squid
# - prob = c(.5, .3, .1, .1)
# - chinstrap: krill, sometimes fish, squid, occasional plankton, seal
# - prob = c(.6, .15, .15, .05, .05)
# - adelie: krill, jellyfish, fish, sometimes amphipods, squid
# - prob = c(.4, .25, .25, .05, .05)
# - swim speed: logic - prob = c(.01, .05, .25, .35, .25, .05, .03, .01)
# - gentoo: max 22mph
# - adelie: about 5mph 
# - chinstrap: about 15-17mph, max 20mph 
# make sure some ID numbers are a little off

library(palmerpenguins)
data(penguins)

# read vectors ----
swim_probs <- c(.01, .05, .25, .35, .25, .05, .03, .01)
name_f <- c("Amy", "Ali", "Ann", "Abi", "Agy", "Ada", "Ari", "Arc", "Aya", "An",
            "Bri", "Bes", "Bea", "Bee", "Bet", "Bae", "Bar", "Ban", "Bex", 
            "Cam", "Cat", "Chi", "Cho", "Cas", "Car", "Cay", "Cal", 
            "Del", "Dot", "Daz", "Day", "Dia", "Dax", "Dor", "Di", 
            "Eta", "Eva", "Era", "Eon", "Eve", "Ewe", "Em", "El", "Es",
            "Fae", "Fen", "Fel", "Fey", "Fly", "Flo", "Fia", "Fan", "Fam", "Fa",
            "Gin", "Gam", "Gem", "Glo", "Gia", "Gal", "Gen", 
            "Hen", "Hex", "Hem", "Hel", "Hid", "Hue", "Hey", "Hae", "Haj", "Hi",
            "Ing", "Ida", "Ixi", "Ivy", "Ire", "Icy", "Io", 
            "Jen", "Jan", "Joy", "Jun", "Jas", "Jaz", "Jam", 
            "Kim", "Kay", "Kat", "Kel", "Kes", "Kit", "Koa", "Kip", 
            "Les", "Lam", "Lin", "Liz", "Liv", "Lou", "Lia", "Lei", "La", "Lu",
            "May", "Mel", "Meg", "Mol", "Mum", "Mae", "Mia", "Mix", "Mac", "Ma",
            "Nix", "Nan", "Nel", "Noa", "Nia", "Nip", "Nox", "Nil", "Nag", 
            "Ola", "Opa", "Ogg", "Oba", 
            "Pen", "Pay", "Pri", "Pel", "Pia", "Pru", "Pip", "Pah", "Phi", "Pi", 
            "Qua", "Qui", 
            "Rin", "Rae", "Rue", "Rho", "Red", "Roe", "Ran", "Ren", "Rhi", "Re", 
            "Sam", "Sar", "Sis", "Sue", "Sal", "Sen", 
            "Tes", "Tip", "Tie", "Tat", "Tru", "Tia", 
            "Una", 
            "Ven", "Vi", "Vin", 
            "Wan", 
            "Xi", "Xis", 
            "Yas", "Yip", "Yap", "Yin", "Yam", 
            "Zip", "Zoe", "Zee", "Zoo")
name_m <- c("Ash", "Abe", "Axe", "And", "Asa", "Ace", "Art", "Alf", "Ask", "Al",
            "Ark", "Aba", "Add", 
            "Ben", "Bob", "Bay", "Bai", "Bo", 
            "Coy", "Cob", "Cub", "Cox", "Cad", "Cab", "Cap", "Cy", 
            "Den", "Don", "Dex", "Dag", "Dal", 
            "Eli", "Elm", "Emu", "Edy", "Eco", "Elk", "Eb", "Ed",
            "Fin", "Fox", "Fez", "Fab", "Fad", "Far", 
            "Gay", "Guy", "Gad", "Gus", "Gab", "Gad", "Go", 
            "Hop", "Har", "Hoy", "Hob", "Hep", "Hap", "Hai", "Hal", "Ho", 
            "Ham", "Hao", "Has", "Hog", "Hej", 
            "Iri", "Ian", "Inu", "Ira", "Ivo", "Ick", 
            "Jay", "Jet", "Jos", "Jax", "Jeb", "Jim", "Jut", "Jag", 
            "Ken", "Kai", "Kin", 
            "Lee", "Len", "Lot", "Leo", "Lev", "Lux", "Lex", "Let", "Lad", "Li", 
            "Moe", "Mug", "Mat", "Mic", "Mec", "Mad", "Mag", "Mu",
            "Nod", "Nat", "Ned", "Neo", "Nay", "Nap", "Nab", "No",
            "Ori", "Oni", "Orc", "Oaf", "Obi", "Oak", "Orb", "Oz", 
            "Pop", "Pin", "Psy", "Pig", "Pal", "Pad", "Pa", 
            "Quo", 
            "Ray", "Reb", "Rex", "Raj", "Roc", "Rad", "Rag", "Rah", "Rai", 
            "Spy", "Sun", "Sap", "Stu", "Sty", "Soy", "Sin", "Sad", "Sag", "Sy", 
            "Tom", "Tod", "Ted", "Try", "Tye", "Tim", "Teo", "Tex", "Tar", "Ty",
            "Ulg", "Uri", "Uli", "Urn", "Ugh", "Udo", "Uke", "Ulu", 
            "Vic", "Vim", "Van", "Vet", "Von", "Vat", "Vas", 
            "Wil", "Wes", "Who", "Way", "Wex", "Wag", "Wad", "Was", 
            "Xo", 
            "Yen", "Yes", "Yah", "Yak", "Yar", "Yo", 
            "Zig", "Zag", "Zil", "Zev", "Zap", "Zed")
name_u <- c("Fry", "Gru", "Hay", "Ink", "Koi", "Max", "Nol", 
            "Rap", "Tog", "Yep", "Zen")


# add diet & speed ----
p <- penguins_raw |> dplyr::select(study = studyName, id = `Sample Number`, 
                                   species = Species, sex = Sex) |>
  dplyr::mutate(id = gsub("^22", 222, id),
                id = gsub(133, 153, id))

g <- p |> dplyr::filter(grepl("Gentoo", species)) |> 
  dplyr::mutate(fave_food = sample(c("krill", "shrimp", "fish", "squid"),
                                   prob = c(.5, .3, .1, .1), size = 124, 
                                   replace = TRUE),
                swim_speed = sample(15:22, prob = swim_probs, size = 124, 
                                    replace = TRUE))
a <- p |> dplyr::filter(grepl("Adelie", species)) |> 
  dplyr::mutate(fave_food = sample(c("krill", "jellyfish", "fish", "amphipods", "squid"),
                                   prob = c(.4, .25, .25, .05, .05), size = 152, 
                                   replace = TRUE),
                swim_speed = sample(3:10, prob = swim_probs, size = 152, 
                                    replace = TRUE))
c <- p |> dplyr::filter(grepl("Chinstrap", species)) |> 
  dplyr::mutate(fave_food = sample(c("krill", "fish", "squid", "plankton", "seal"),
                                   prob = c(.6, .15, .15, .05, .05), size = 68, 
                                   replace = TRUE),
                swim_speed = sample(13:20, prob = swim_probs, size = 68, 
                                    replace = TRUE))

# add names ----
p <- dplyr::bind_rows(list(g, a, c)) 

f <- p |> dplyr::filter(sex == "FEMALE") |>
  dplyr::mutate(name = sample(name_f, size = 165))
m <- p |> dplyr::filter(sex == "MALE") |>
  dplyr::mutate(name = sample(name_m, size = 168))
u <- p |> dplyr::filter(is.na(sex)) |>
  dplyr::mutate(name = sample(name_u, size = 11))

# prep final dataset
p <- dplyr::bind_rows(list(f, m, u)) |> 
  dplyr::select(studyName = study, `Sample Number` = id, Species = species,
                Sex = sex, `Favorite food` = fave_food, 
                `Swim speed` = swim_speed, Name = name)
  

write_csv(p, "content/page/exercise/day5/penguin_names.csv", na = "")

# p |> dplyr::group_by(species, fave_food) |>
#   dplyr::summarise(swim_speed = mean(swim_speed), 
#                    n = dplyr::n()) |> dplyr::arrange(species, n)



