# t.string :name
# t.string :kind
# t.string :brewery_name
# t.string :brewery_url
# t.string :brewery_country
# t.string :brewery_city
# t.text :description
# t.float :abv
# t.integer :ibu
# t.string :logo_url
# t.text :review
# t.float :rating
# t.string :beer_url
#
Beer.create!(
    name: 'Vertigo', kind: 'IPA - American', brewery_name: 'BAPBAP', brewery_url: 'https://untappd.com/BAP_BAP',
    brewery_country: 'France', brewery_city: 'Paris',
    description: "Pour notre IPA, nous avons voulu donner la part belle aux houblons aromatiques et aux amertumes parfumées, en réalisant un assemblage de trois houblons : Magnum, Summit et le Sorachi Ace en houblonnage à cru. Le résultat est une IPA complexe, à la robe caramel, aux reflets rouges et auburn. le tout surmonté d’une fine mousse blanc cassé. Son nez est puissant et fruité, avec des notes d'aneth et de coco typiques du houblon Sorachi Ace. En bouche, les arômes fruités sont soutenus par les malts caramélisés. Après quelques instants les houblons amérisants viennent parfaitement équilibrer les premières notes sucrées pour une finale sèche, amère et parfumée.",
    abv: 6.0,
    ibu: 51,
    logo_url: "https://untappd.akamaized.net/site/beer_logos/beer-3312057_b95bf_sm.jpeg",
    review: "Pas mal, mais un peu amère",
    rating: 4.0,
    beer_url: 'https://untappd.com/b/bapbap-vertigo/3312057'
 )

Beer.create!(
    name: 'Originale', kind: 'Pale Ale - English', brewery_name: 'BAPBAP', brewery_url: 'https://untappd.com/BAP_BAP',
    brewery_country: 'France', brewery_city: 'Paris',
    description: "1ère bière à sortir des cuves de la rue Saint-Maur, la BAPBAP Originale est une interprétation parisienne et moderne des Pale Ales à l’anglaise : sa recette est issue d’un mélange subtil entre la douceur des malts (d’orge et de blé) et les notes rafraîchissantes délivrées par le houblon. Le houblon Cascade procure des arômes d’agrumes qui se mêlent aux sucres résiduels du malt Cara Vienne. C’est une bière dorée, ronde et fruitée qui dévoile une agréable amertume en fin de bouche.",
    abv: 5.8,
    ibu: 20,
    logo_url: "https://untappd.akamaized.net/site/beer_logos/beer-3312054_1f415_sm.jpeg",
    review: "J'adore",
    rating: 4.5,
    beer_url: 'https://untappd.com/b/bapbap-originale/3312054'
)

Beer.create!(
    name: 'Shifumi', kind: 'Pale Ale - English', brewery_name: 'BAPBAP', brewery_url: 'https://untappd.com/BAP_BAP',
    brewery_country: 'France', brewery_city: 'Paris',
    description: "Troisième version de notre bière éphémère qui met à chaque fois en valeur une variété de houblon en houblonnage à froid, ce nouveau cru de Shifumi a été dry-hoppé au Citra.  Cela donne une bière légère et céréalière, au nez explosif de fruits tropicaux (mangue, litchi…), et à la bouche douce et florale, relevée par une amertume discrète, nous incitant à y revenir sans cesse.",
    abv: 5.3,
    ibu: nil,
    logo_url: "https://untappd.akamaized.net/site/beer_logos/beer-3238791_b5ab6_sm.jpeg",
    review: "Bla bla bla",
    rating: 3.5,
    beer_url: 'https://untappd.com/b/bapbap-shifumi-2019/3238791'
)